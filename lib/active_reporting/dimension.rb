module ActiveReporting
  class Dimension
    attr_reader :name

    def initialize(model, name:, label: :value)
      @model      = model
      @name       = name
      @label      = label
    end

    def type
      @type ||= if @model.column_names.include?(@name.to_s)
                  :degenerate
                elsif association
                  :standard
                else
                  raise UnknownDimension.new(@name, @model)
                end
    end

    def foreign_key
      association ? association.foreign_key : @name.to_s
    end

    def select_statement(with_identifier: true)
      return [degenerate_fragment] if type == :degenerate

      ss = ["#{label_fragment} AS #{@name}"]
      ss << "#{identifier_fragment} AS #{@name}_identifier" if with_identifier
      ss
    end

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
