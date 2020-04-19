# frozen_string_literal: true

require 'forwardable'
module ActiveReporting
  AGGREGATES = %i[count sum max min avg].freeze

  class Metric
    extend Forwardable
    def_delegators :@fact_model, :model
    attr_reader :fact_model,
                :name,
                :dimensions,
                :dimension_filter,
                :aggregate,
                :aggregate_expression,
                :metric_filter,
                :order_by_dimension

    def initialize(
      name,
      fact_model:,
      aggregate: :count,
      dimensions: [],
      dimension_filter: {},
      metric_filter: {},
      order_by_dimension: {}
    )
      @name               = name.to_sym
      @fact_model         = fact_model
      @dimension_filter   = dimension_filter
      @metric_filter      = metric_filter
      @dimensions         = ReportingDimension.build_from_dimensions(@fact_model, Array(dimensions))
      @order_by_dimension = order_by_dimension
      validate_aggregate(aggregate)
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

    def validate_aggregate(agg)
      agg_name, expr = agg.is_a?(Hash) ? Array(agg).flatten : [agg.to_sym, nil]
      raise UnknownAggregate, "Unknown aggregate '#{agg_name}'" unless AGGREGATES.include?(agg_name)
      validate_agg_expression(expr) if expr
      @aggregate = agg_name
      @aggregate_expression = @fact_model.aggregate_expressions[expr]
    end

    def validate_agg_expression(expr)
      return if @fact_model.aggregate_expressions[expr]
      raise UnknownAggregateExpression,
            "Aggregate expression '#{expr}' not defined in '#{@fact_model.name}'"
    end
  end
end
