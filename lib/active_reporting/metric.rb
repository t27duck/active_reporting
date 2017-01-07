require 'forwardable'
module ActiveReporting
  class Metric
    extend Forwardable
    def_delegators :@fact_model, :model
    attr_reader :fact_model, :dimensions

    def initialize(name, fact_model:, dimensions: [])
      @name = name
      @fact_model = fact_model
      @dimensions = determine_dimensions Array(dimensions)
    end

    private ####################################################################

    def determine_dimensions(dimensions)
      [].tap do |dims|
        dimensions.each do |dim|
          d = @fact_model.dimensions[dim.to_sym]
          raise UnknownDimension.new(dim, @fact_model.model) unless d.present?
          dims << d
        end
      end
    end
  end
end
