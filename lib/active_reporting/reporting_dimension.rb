require 'forwardable'
module ActiveReporting
  class ReportingDimension
    extend Forwardable
    def_delegators :@dimension, :name, :type, :klass, :association, :model

    def initialize(dimension, label: nil)
      @dimension  = dimension
      @label      = label
    end

    # The foreign key to use in queries
    #
    # @return [String]
    def foreign_key
      association ? association.foreign_key : name
    end

    # Fragments of a select statement for queries that use the dimension
    # @return [Array]
    def select_statement(with_identifier: true)
      return [degenerate_fragment] if type == :degenerate

      ss = ["#{label_fragment} AS #{name}"]
      ss << "#{identifier_fragment} AS #{name}_identifier" if with_identifier
      ss
    end

    # Fragments of a group by clause for queries that use the dimension
    # @return [Array]
    def group_by_statement(with_identifier: true)
      return [degenerate_fragment] if type == :degenerate

      group = [label_fragment]
      group << identifier_fragment if with_identifier
      group
    end

    private ####################################################################

    def label
      @label ||= dimension_fact_model.dimension_label || Configuration.default_dimension_label
    end

    def degenerate_fragment
      "#{model.quoted_table_name}.#{name}"
    end

    def identifier_fragment
      "#{klass.quoted_table_name}.#{klass.primary_key}"
    end

    def label_fragment
      "#{klass.quoted_table_name}.#{label}"
    end

    def dimension_fact_model
      @dimension_fact_model ||= klass.fact_model
    end
  end
end
