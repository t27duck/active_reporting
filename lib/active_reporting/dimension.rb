# frozen_string_literal: true

module ActiveReporting
  class Dimension
    TYPES = { degenerate: :degenerate, standard: :standard }.freeze
    attr_reader :name
    attr_reader :label_column

    # @param model [ActiveRecord::Base]
    # @param name [Symbol]
    # @param label_column [Symbol]
    def initialize(fact_model, name:, label_column: nil)
      @fact_model   = fact_model
      @name         = name.to_s
      @label_column = label_column
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
                  TYPES[:degenerate]
                elsif association
                  TYPES[:standard]
                else
                  raise UnknownDimension, "Dimension '#{@name}' not found on fact model '#{@fact_model}'"
                end
    end

    # Tells if the dimension is hierarchical
    #
    # @return [Boolean]
    def hierarchical?
      @hierarchical ||= !klass.fact_model.hierarchical_levels.empty?
    end

    # Returns either the model of the dimension's association or the model
    # itself if the dimension lives on the fact model
    #
    # @return [Boolean]
    def klass
      @klass ||= association ? association.klass : model
    end

    # Returns the fact model's dimension
    #
    # @return [ActiveRecord::Base]
    def model
      @model ||= @fact_model.model
    end

    # Returns the reflected association of the fact model to dimension name
    #
    # @return [ActiveRecord::Reflection]
    def association
      @association ||= model.reflect_on_association(@name)
    end
  end
end
