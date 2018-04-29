# frozen_string_literal: true

require 'forwardable'
module ActiveReporting
  class Report
    AGGREGATE_FUNCTION_OPERATORS = {
      eq:   '=',
      gt:   '>',
      gte:  '>=',
      lt:   '<',
      lte:  '<='
    }.freeze

    extend Forwardable
    def_delegators :@metric, :fact_model, :model

    def initialize(metric, dimension_identifiers: true, dimension_filter: {}, dimensions: [], metric_filter: {})
      @metric = metric.is_a?(Metric) ? metric : ActiveReporting.fetch_metric(metric)
      raise UnknownMetric, "Unknown metric #{metric}" if @metric.nil?

      @dimension_identifiers  = dimension_identifiers
      local_dimensions        = ReportingDimension.build_from_dimensions(fact_model, Array(dimensions))
      @dimensions             = (@metric.dimensions + local_dimensions).uniq
      @metric_filter          = @metric.metric_filter.merge(metric_filter)
      @ordering               = @metric.order_by_dimension
      partition_dimension_filters dimension_filter
    end

    # Builds and executes a query, returning the raw result
    #
    # @return [Array]
    def run
      @run ||= build_data
    end

    private ######################################################################

    def build_data
      @data = model.connection.exec_query(statement.to_sql).to_hash
      apply_dimension_callbacks
      @data
    end

    def partition_dimension_filters(user_dimension_filter)
      @dimension_filters = { ransack: {}, scope: {}, lambda: {} }
      user_dimension_filter.merge(@metric.dimension_filter).each do |key, value|
        dm = fact_model.find_dimension_filter(key.to_sym)
        @dimension_filters[dm.type][dm] = value
      end
    end

    def statement
      parts = {
        select: select_statement,
        joins: dimension_joins,
        group: group_by_statement,
        having: having_statement,
        order: order_by_statement
      }

      statement = ([model] + parts.keys).inject do |chain, method|
        chain.public_send(method, parts[method])
      end

      statement = process_scope_dimension_filter(statement)
      statement = process_lambda_dimension_filter(statement)
      statement = process_ransack_dimension_filter(statement)

      statement
    end

    def select_statement
      ss = ["#{select_aggregate} AS #{@metric.name}"]
      ss += @dimensions.map { |d| d.select_statement(with_identifier: @dimension_identifiers) }
      ss.flatten
    end

    def select_aggregate
      case @metric.aggregate
      when :count
        'COUNT(*)'
      else
        "#{@metric.aggregate.to_s.upcase}(#{fact_model.measure})"
      end
    end

    def dimension_joins
      @dimensions.select { |d| d.type == :standard }.map { |d| d.name.to_sym }
    end

    def group_by_statement
      @dimensions.map { |d| d.group_by_statement(with_identifier: @dimension_identifiers) }
    end

    def process_scope_dimension_filter(chain)
      @dimension_filters[:scope].each do |dm, args|
        chain = if [true, 'true'].include?(args)
                  chain.public_send(dm.name)
                else
                  chain.public_send(dm.name, args)
                end
      end
      chain
    end

    def process_lambda_dimension_filter(chain)
      @dimension_filters[:lambda].each do |df, args|
        chain = if [true, 'true'].include?(args)
                  chain.scoping { model.instance_exec(&df.body) }
                else
                  chain.scoping { model.instance_exec(args, &df.body) }
                end
      end
      chain
    end

    def process_ransack_dimension_filter(chain)
      ransack_hash = {}
      @dimension_filters[:ransack].each do |dm, value|
        ransack_hash[dm.name] = value
      end
      chain = chain.ransack(ransack_hash).result if ransack_hash.present?
      chain
    end

    def having_statement
      @metric_filter.map do |operator, value|
        "#{select_aggregate} #{AGGREGATE_FUNCTION_OPERATORS[operator]} #{value.to_f}"
      end.join(' AND ')
    end

    def order_by_statement
      [].tap do |o|
        @ordering.each do |dimension_key, direction|
          dim = @dimensions.detect { |d| d.name.to_sym == dimension_key.to_sym }
          o << dim.order_by_statement(direction: direction) if dim
        end
      end
    end

    def apply_dimension_callbacks
      @dimensions.each do |dimension|
        callback = dimension.label_callback
        next unless callback
        @data.each do |hash|
          hash[dimension.name.to_s] = callback.call(hash[dimension.name.to_s])
        end
      end
    end
  end
end
