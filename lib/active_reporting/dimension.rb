module ActiveReporting
  class Dimension
    attr_reader :name

    # @param model [ActiveRecord::Base]
    # @param name [Symbol]
    # @param label [String, Symbol]
    def initialize(model, name:, label: nil)
      @model      = model
      @name       = name
      @label      = label || Configuration.default_dimension_label
    end

    # Determins the type of the dimension
    #
    # A dimension type is either:
    #
    # * standard - The dimension is a relation to the fact model's model
    # * degenerate - The dimension is the model's attribute
    #
    # @return [Symbol]
    def type
      @type ||= if @model.column_names.include?(@name.to_s)
                  :degenerate
                elsif association
                  :standard
                else
                  raise UnknownDimension.new(@name, @model)
                end
    end

    # The foreign key to use in queries
    #
    # @return [String]
    def foreign_key
      association ? association.foreign_key : @name.to_s
    end

    # Fragments of a select statement for queries that use the dimension
    # @return [Array]
    def select_statement(with_identifier: true)
      return [degenerate_fragment] if type == :degenerate

      ss = ["#{label_fragment} AS #{@name}"]
      ss << "#{identifier_fragment} AS #{@name}_identifier" if with_identifier
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

    private ######################################################################

    def association
      @association_info ||= @model.reflect_on_association(@name.to_s)
    end

    def degenerate_fragment
      "#{@model.quoted_table_name}.#{@name}"
    end

    def identifier_fragment
      "#{association.klass.quoted_table_name}.#{association.klass.primary_key}"
    end

    def label_fragment
      "#{association.klass.quoted_table_name}.#{@label}"
    end
  end
end
