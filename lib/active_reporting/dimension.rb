module ActiveReporting
  class Dimension
    attr_reader :name

    # @param model [ActiveRecord::Base]
    # @param name [Symbol]
    def initialize(fact_model, name:)
      @fact_model = fact_model
      @name       = name.to_s
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
      @type ||= if model.column_names.include?(@name)
                  :degenerate
                elsif !klass.fact_model.hierarchical_levels.empty?
                  :hierarchical
                elsif association
                  :standard
                else
                  raise UnknownDimension, "Dimension '#{@name}' not found on fact model '#{@fact_model}'"
                end
    end

    private ####################################################################

    def klass
      @klass ||= association ? association.klass : model
    end

    def model
      @model ||= @fact_model.model
    end

    def association
      @association_info ||= model.reflect_on_association(@name)
    end
  end
end
