# frozen_string_literal: true

require 'forwardable'
module ActiveReporting
  class ReportingDimension
    extend Forwardable
    def_delegators :@dimension, :name, :type, :klass, :association, :model, :hierarchical?, :datetime?

    def self.build_from_dimensions(fact_model, dimensions)
      Array(dimensions).map do |dim|
        dimension_name, label = dim.is_a?(Hash) ? Array(dim).flatten : [dim, nil]
        found_dimension = fact_model.dimensions[dimension_name.to_sym]

        raise(UnknownDimension, "Dimension '#{dim}' not found on fact model '#{fact_model}'") if found_dimension.nil?

        new(found_dimension, label_config(label))
      end
    end

    # If you pass a symbol it means you just indicate
    # the field on that dimension. With a hash you can
    # customize the name of the label
    #
    # @param [Symbol|Hash] label
    def self.label_config(label)
      return { label: label } unless label.is_a?(Hash)

      {
        label: label[:field],
        label_name: label[:name]
      }
    end

    # @param dimension [ActiveReporting::Dimension]
    # @option label [Maybe<Symbol>] Hierarchical dimension to be used as a label
    # @option label_name [Maybe<Symbol|String>] Hierarchical dimension custom name
    def initialize(dimension, label: nil, label_name: nil)
      @dimension = dimension

      determine_label_field(label)
      determine_label_name(label_name)
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
      return [degenerate_select_fragment] if type == Dimension::TYPES[:degenerate]

      ss = ["#{label_fragment} AS #{@label_name}"]
      ss << "#{identifier_fragment} AS #{name}_identifier" if with_identifier
      ss
    end

    # Fragments of a group by clause for queries that use the dimension
    #
    # @return [Array]
    def group_by_statement(with_identifier: true)
      return [degenerate_fragment] if type == Dimension::TYPES[:degenerate]

      group = [label_fragment]
      group << identifier_fragment if with_identifier
      group
    end

    # Fragment of an order by clause for queries that sort by the dimension
    #
    # @return [String]
    def order_by_statement(direction:)
      direction = direction.to_s.upcase
      raise "Ording direction should be 'asc' or 'desc'" unless %w[ASC DESC].include?(direction)
      return "#{degenerate_fragment} #{direction}" if type == Dimension::TYPES[:degenerate]
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
      @label = if label_field.present? && validate_hierarchical_label(label_field)
                 label_field.to_sym
               else
                 dimension_fact_model.dimension_label || Configuration.default_dimension_label
               end
    end

    def determine_label_name(label_name)
      @label_name = label_name ? "#{name}_#{label_name}" : name
    end

    def validate_hierarchical_label(hierarchical_label)
      if datetime?
        validate_against_datetime_hierarchies(hierarchical_label)
      else
        validate_dimension_is_hierachical(hierarchical_label)
        validate_against_fact_model_properties(hierarchical_label)
      end
      true
    end

    def validate_dimension_is_hierachical(hierarchical_label)
      return if hierarchical?

      raise InvalidDimensionLabel, "#{name} must be hierarchical to use label #{hierarchical_label}"
    end

    def validate_against_datetime_hierarchies(hierarchical_label)
      return if Configuration.db_adapter.allowed_datetime_hierarchy?(hierarchical_label)

      raise InvalidDimensionLabel, "#{hierarchical_label} is not a valid datetime grouping label in #{name}"
    end

    def validate_against_fact_model_properties(hierarchical_label)
      return if dimension_fact_model.hierarchical_levels.include?(hierarchical_label.to_sym)

      raise InvalidDimensionLabel, "#{hierarchical_label} is not a hierarchical label in #{name}"
    end

    def degenerate_fragment
      return "#{name}_#{@label}" if datetime?

      "#{model.quoted_table_name}.#{name}"
    end

    def degenerate_select_fragment
      return "#{model.quoted_table_name}.#{name}" unless datetime?

      date_trunc = Configuration.db_adapter.date_trunc(
        @label, "#{model.quoted_table_name}.#{name}"
      )
      "#{date_trunc} AS #{name}_#{@label}"
    end

    def identifier_fragment
      "#{klass.quoted_table_name}.#{klass.primary_key}"
    end

    def label_fragment
      "#{klass.quoted_table_name}.#{@label}"
    end

    def dimension_fact_model
      @dimension_fact_model ||= klass.fact_model
    end
  end
end
