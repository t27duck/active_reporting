# frozen_string_literal: true

require 'forwardable'
module ActiveReporting
  class ReportingDimension
    extend Forwardable
    SUPPORTED_DBS = %w[PostgreSQL PostGIS Mysql2].freeze
    # Values for the Postgres `date_trunc` method.
    # See https://www.postgresql.org/docs/10/static/functions-datetime.html#FUNCTIONS-DATETIME-TRUNC
    DATETIME_HIERARCHIES = %i[microseconds milliseconds second minute hour day week month quarter year decade
                              century millennium date].freeze
    JOIN_METHODS = { joins: :joins, left_outer_joins: :left_outer_joins }.freeze
    attr_reader :join_method, :label

    def_delegators :@dimension, :name, :type, :klass, :association, :model, :hierarchical?, :label_column

    def self.build_from_dimensions(fact_model, dimensions)
      Array(dimensions).map do |dim|
        dimension_name, options = dim.is_a?(Hash) ? Array(dim).flatten : [dim, nil]
        found_dimension = fact_model.dimensions[dimension_name.to_sym]

        raise(UnknownDimension, "Dimension '#{dimension_name}' not found on fact model '#{fact_model}'") if found_dimension.nil?

        # Ambiguous behavior with string option for degenerate and standard dimension
        if !options.is_a?(Hash) && found_dimension.type == Dimension::TYPES[:degenerate]
          ActiveSupport::Deprecation.warn <<~EOS
            direct use of implict hierarchies is deprecated and will be removed in future versions. \
            Please use `:datetime_drill` option instead.
          EOS
          options = { datetime_drill: options }
        end
        new(found_dimension, **label_config(options))
      end
    end

    # If you pass a symbol it means you just indicate
    # the field on that dimension. With a hash you can
    # customize the name of the label
    #
    # @param [Symbol|Hash] options
    def self.label_config(options)
      unless options.is_a?(Hash)
        return { label: options }
      end

      {
        label: options[:field],
        label_name: options[:name],
        join_method: options[:join_method],
        datetime_drill: options[:datetime_drill]
      }
    end

    # @param dimension [ActiveReporting::Dimension]
    # @option label [Maybe<Symbol>] Hierarchical dimension to be used as a label
    # @option label_name [Maybe<Symbol|String>] Hierarchical dimension custom name
    def initialize(dimension, label: nil, label_name: nil, join_method: nil, datetime_drill: nil)
      @dimension = dimension

      determine_label_field(label)
      determine_datetime_drill(datetime_drill)
      determine_label_name(label_name)
      determine_join_method(join_method)
    end

    # The foreign key to use in queries
    #
    # @return [String]
    def foreign_key
      association ? association.foreign_key : name
    end

    # Fragments of a select statement for queries that use the dimension
    #
    # @return [Array]
    def select_statement(with_identifier: true)
      ss = ["#{label_fragment} AS #{label_fragment_alias}"]
      ss << "#{identifier_fragment} AS #{identifier_fragment_alias}" if with_identifier && type == Dimension::TYPES[:standard]
      ss
    end

    # Fragments of a group by clause for queries that use the dimension
    #
    # @return [Array]
    def group_by_statement(with_identifier: true)
      group = [label_fragment]
      group << identifier_fragment if with_identifier && type == Dimension::TYPES[:standard]
      group
    end

    # Fragment of an order by clause for queries that sort by the dimension
    #
    # @return [String]
    def order_by_statement(direction:)
      direction = direction.to_s.upcase
      raise "Ording direction should be 'asc' or 'desc'" unless %w[ASC DESC].include?(direction)
      "#{label_fragment} #{direction}"
    end

    # Looks up the dimension label callback for the label
    #
    # @return [Lambda, NilClass]
    def label_callback
      klass.fact_model.dimension_label_callbacks[@label]
    end

    private ####################################################################

    def determine_label_field(label_field)
      @label = if @dimension.label_column.present?
                 @dimension.label_column
               elsif label_field.present? && validate_hierarchical_label(label_field)
                 type == Dimension::TYPES[:degenerate] ? name : label_field.to_sym
               elsif type == Dimension::TYPES[:degenerate]
                 name
               else
                 dimension_fact_model.dimension_label || Configuration.default_dimension_label
               end
    end

    def determine_label_name(label_name)
      if label_name
        @label_name = label_name
      else
        @label_name = name
        @label_name += "_#{@label}" if type == Dimension::TYPES[:standard] && @label != :name && @dimension.label_column.blank?
        @label_name += "_#{@datetime_drill}" if @datetime_drill
      end
      @label_name
    end

    def determine_datetime_drill(datetime_drill)
      return unless datetime_drill
      validate_supported_database_for_datetime_hierarchies
      validate_against_datetime_hierarchies(datetime_drill)
      validate_label_is_datetime
      @datetime_drill = datetime_drill
    end

    def determine_join_method(join_method)
      if join_method.blank?
        @join_method = ReportingDimension::JOIN_METHODS[:joins]
      elsif ReportingDimension::JOIN_METHODS.include?(join_method)
        @join_method = join_method
      else
        raise UnknownJoinMethod, "Method '#{join_method}' not included in '#{ReportingDimension::JOIN_METHODS.values}'"
      end
    end

    def validate_hierarchical_label(hierarchical_label)
      validate_dimension_is_hierachical(hierarchical_label)
      validate_against_fact_model_properties(hierarchical_label)
      true
    end

    def validate_dimension_is_hierachical(hierarchical_label)
      return if hierarchical?
      raise InvalidDimensionLabel, "#{name} must be hierarchical to use label #{hierarchical_label}"
    end

    def validate_supported_database_for_datetime_hierarchies
      return if SUPPORTED_DBS.include?(model.connection.adapter_name)
      raise InvalidDimensionLabel,
            "Cannot utilize datetime grouping for #{name}; " \
            "database #{model.connection.adapter_name} is not supported"
    end

    def validate_against_datetime_hierarchies(hierarchical_label)
      return if DATETIME_HIERARCHIES.include?(hierarchical_label.to_sym)
      raise InvalidDimensionLabel, "#{hierarchical_label} is not a valid datetime grouping label in #{name}"
    end

    def validate_label_is_datetime
      return if dimension_fact_model.model.column_for_attribute(@label).type == :datetime
      raise InvalidDimensionLabel, "'#{@label}' is not a datetime column"
    end

    def validate_against_fact_model_properties(hierarchical_label)
      return if dimension_fact_model.hierarchical_levels.include?(hierarchical_label.to_sym)
      raise InvalidDimensionLabel, "#{hierarchical_label} is not a hierarchical label in #{name}"
    end

    def datetime_drill_label_fragment(column)
      if model.connection.adapter_name == "Mysql2"
        datetime_drill_mysql(column)
      else # Postgress
        datetime_drill_postgress(column)
      end
    end

    def datetime_drill_postgress(column)
      case @datetime_drill.to_sym
      when :date
        "DATE('#{column}')"
      else
        "DATE_TRUNC('#{@datetime_drill}', #{column})"
      end
    end

    def datetime_drill_mysql(column)
      case @datetime_drill.to_sym
      when :microseconds
        "MICROSECOND(#{column})"
      when :milliseconds
        "MICROSECOND(#{column}) DIV 1000"
      when :second
        "SECOND(#{column})"
      when :minute
        "MINUTE(#{column})"
      when :hour
        "HOUR(#{column})"
      when :day
        "DAY(#{column})"
      when :week
        "WEEKDAY(#{column})"
      when :month
        "MONTH(#{column})"
      when :quarter
        "QUARTER(#{column})"
      when :year
        "YEAR(#{column})"
      when :decade
        "YEAR(#{column}) DIV 10"
      when :century
        "YEAR(#{column}) DIV 100"
      when :millennium
        "YEAR(#{column}) DIV 1000"
      when :date
        "DATE(#{column})"
      end
    end

    def identifier_fragment
      "#{klass.quoted_table_name}.#{model.connection.quote_column_name(klass.primary_key)}"
    end

    def identifier_fragment_alias
      "#{model.connection.quote_column_name("#{name}_identifier")}"
    end

    def label_fragment
      fragment = "#{klass.quoted_table_name}.#{model.connection.quote_column_name(@label)}"
      fragment = datetime_drill_label_fragment(fragment) if @datetime_drill
      fragment
    end

    def label_fragment_alias
      "#{model.connection.quote_column_name(@label_name)}"
    end

    def dimension_fact_model
      @dimension_fact_model ||= klass.fact_model
    end
  end
end
