# frozen_string_literal: true

require 'forwardable'
module ActiveReporting
  AGGREGATES = %i[count sum max min avg].freeze

  class Metric
    extend Forwardable
    def_delegators :@fact_model, :model
    attr_reader :fact_model, :name, :dimensions, :dimension_filter, :aggregate
    attr_reader :metric_filter, :order_by_dimension, :measure

    def initialize(
      name,
      fact_model:,
      aggregate: :count,
      dimensions: [],
      dimension_filter: {},
      metric_filter: {},
      order_by_dimension: {},
      measure: nil
    )
      @name               = name.to_sym
      @fact_model         = fact_model
      @dimension_filter   = dimension_filter
      @aggregate          = determin_aggregate(aggregate.to_sym)
      @metric_filter      = metric_filter
      @dimensions         = ReportingDimension.build_from_dimensions(@fact_model, Array(dimensions))
      @order_by_dimension = order_by_dimension
      @measure            = measure
      check_dimension_filter
    end

    # Builds an ActiveReporting::Report object based on the metric
    #
    # @return [ActiveReporting::Report]
    def report
      Report.new(self)
    end

    private ####################################################################

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
