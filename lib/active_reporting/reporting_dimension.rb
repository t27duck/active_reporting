# frozen_string_literal: true

require 'forwardable'
module ActiveReporting
  class ReportingDimension
    extend Forwardable

    # Values for the Postgres `date_trunc` method.
    # See https://www.postgresql.org/docs/current/functions-datetime.html#FUNCTIONS-DATETIME-TRUNC
    DATETIME_HIERARCHIES = %i[microseconds milliseconds second minute hour day week month quarter year decade
                              century millennium date].freeze
    # Column types a datetime drill can be used on. PostgreSQL reports `timestamp with time zone` columns as
    # `timestamptz`, and `timestamp without time zone` columns as `timestamp` when its `datetime_type` is
    # `:timestamptz`.
    DATETIME_DRILL_COLUMN_TYPES = %i[datetime timestamp timestamptz date].freeze
    JOIN_METHODS = { joins: :joins, left_outer_joins: :left_outer_joins }.freeze
    attr_reader :join_method, :label, :label_name

    def_delegators :@dimension, :name, :type, :klass, :association, :model, :hierarchical?

    def self.build_from_dimensions(fact_model, dimensions)
      Array(dimensions).map do |dim|
        dimension_name, options = dim.is_a?(Hash) ? Array(dim).flatten : [dim, nil]
        found_dimension = fact_model.dimensions[dimension_name.to_sym]

        if found_dimension.nil?
          raise(UnknownDimension,
                "Dimension '#{dimension_name}' not found on fact model '#{fact_model}'")
        end

        # The `{ created_at: :month }` shorthand for datetime drills was removed in 0.7.0
        if options && !options.is_a?(Hash) && found_dimension.type == Dimension::TYPES[:degenerate]
          raise InvalidDimensionLabel,
                "'#{dimension_name}' is not hierarchical. For a datetime drill, use " \
                "`{ #{dimension_name}: { datetime_drill: :#{options} } }` " \
                "instead of `{ #{dimension_name}: :#{options} }`"
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
      return { label: options } unless options.is_a?(Hash)

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
      if with_identifier && type == Dimension::TYPES[:standard]
        ss << "#{identifier_fragment} AS #{identifier_fragment_alias}"
      end
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
      unless %w[ASC DESC].include?(direction)
        raise InvalidOrderDirection,
              "Ordering direction for #{name} should be 'asc' or 'desc', got '#{direction.downcase}'"
      end

      "#{label_fragment} #{direction}"
    end

    # Looks up the dimension label callback for the label
    #
    # @return [Lambda, NilClass]
    def label_callback
      klass.fact_model.dimension_label_callbacks[@label.to_sym]
    end

    private ####################################################################

    def determine_label_field(label_field)
      validate_hierarchical_label(label_field) if label_field.present?

      @label = if type == Dimension::TYPES[:degenerate]
                 name
               elsif label_field.present?
                 label_field.to_sym
               else
                 dimension_fact_model.dimension_label || Configuration.default_dimension_label
               end
    end

    def determine_label_name(label_name)
      if label_name
        @label_name = label_name
      else
        @label_name = name
        @label_name += "_#{@label}" if type == Dimension::TYPES[:standard] && @label != :name
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
      validate_dimension_is_hierarchical(hierarchical_label)
      validate_against_fact_model_properties(hierarchical_label)
    end

    def validate_dimension_is_hierarchical(hierarchical_label)
      return if hierarchical?

      raise InvalidDimensionLabel, "#{name} must be hierarchical to use label #{hierarchical_label}"
    end

    def validate_supported_database_for_datetime_hierarchies
      return if datetime_drill_adapter

      raise InvalidDimensionLabel,
            "Cannot utilize datetime grouping for #{name}; " \
            "database #{model.connection.adapter_name} is not supported"
    end

    def validate_against_datetime_hierarchies(hierarchical_label)
      return if DATETIME_HIERARCHIES.include?(hierarchical_label.to_sym)

      raise InvalidDimensionLabel, "#{hierarchical_label} is not a valid datetime grouping label in #{name}"
    end

    def validate_label_is_datetime
      return if DATETIME_DRILL_COLUMN_TYPES.include?(dimension_fact_model.model.column_for_attribute(@label).type)

      raise InvalidDimensionLabel, "'#{@label}' is not a datetime or date column"
    end

    def validate_against_fact_model_properties(hierarchical_label)
      return if dimension_fact_model.hierarchical_levels.include?(hierarchical_label.to_sym)

      raise InvalidDimensionLabel, "#{hierarchical_label} is not a hierarchical label in #{name}"
    end

    def datetime_drill_adapter
      return @datetime_drill_adapter if defined?(@datetime_drill_adapter)

      @datetime_drill_adapter = DatetimeDrill.adapter_for(model.connection)
    end

    def identifier_fragment
      "#{klass.quoted_table_name}.#{model.connection.quote_column_name(klass.primary_key)}"
    end

    def identifier_fragment_alias
      model.connection.quote_column_name("#{name}_identifier").to_s
    end

    def label_fragment
      fragment = "#{klass.quoted_table_name}.#{model.connection.quote_column_name(@label)}"
      fragment = DatetimeDrill.fragment(datetime_drill_adapter, @datetime_drill, fragment) if @datetime_drill
      fragment
    end

    def label_fragment_alias
      model.connection.quote_column_name(@label_name).to_s
    end

    def dimension_fact_model
      @dimension_fact_model ||= klass.fact_model
    end
  end
end
