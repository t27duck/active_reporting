require 'forwardable'
module ActiveReporting
  AGGREGATES = %i(count sum max min avg).freeze

  class Metric
    extend Forwardable
    def_delegators :@fact_model, :model
    attr_reader :fact_model, :name, :dimensions, :dimension_filter, :aggregate

    def initialize(name, fact_model:, aggregate: :count, dimensions: [], dimension_filter: {})
      @name             = name.to_sym
      @fact_model       = fact_model
      @dimension_filter = dimension_filter
      @aggregate        = determin_aggregate(aggregate.to_sym)
      determine_dimensions Array(dimensions)
      check_dimension_filter
    end

    private ####################################################################

    def determine_dimensions(dimensions)
      @dimensions = []
      dimensions.each do |dim|
        dimension_name, label = dim.is_a?(Hash) ? Array(dim) : [dim, nil]
        found_dimension = @fact_model.dimensions[dimension_name.to_sym]
        if found_dimension.nil?
          raise UnknownDimension, "Dimension '#{dim}' not found on fact model '#{@fact_model}'"
        end
        @dimensions << ReportingDimension.new(found_dimension, label: label)
      end
    end

    def check_dimension_filter
      @dimension_filter.each do |name, _|
        @fact_model.find_dimension_filter(name)
      end
    end

    def determin_aggregate(agg)
      raise UnknownAggregate, "Unknown aggregate '#{agg}'" unless AGGREGATES.include?(agg)
      @aggregate = agg
    end
  end
end
