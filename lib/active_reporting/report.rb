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

    def initialize(metric, dimension_identifiers: true, dimension_filter: {}, dimensions: [], metric_filter: {}, data_format: :standard)
      @metric = metric.is_a?(Metric) ? metric : ActiveReporting.fetch_metric(metric)
      raise UnknownMetric, "Unknown metric #{metric}" if @metric.nil?

      @dimension_identifiers  = dimension_identifiers
      local_dimensions        = ReportingDimension.build_from_dimensions(fact_model, Array(dimensions))
      @dimensions             = (@metric.dimensions + local_dimensions).uniq
      @metric_filter          = @metric.metric_filter.merge(metric_filter)
      @ordering               = @metric.order_by_dimension
      partition_dimension_filters dimension_filter
      @data_format            = data_format
    end

    # Builds and executes a query, returning the raw result
    #
    # @return [Array, Hash]
    def run
      @run ||= build_data

      # Pass format as a block
      block_given? ? yield(@metric, @dimensions, @run) : @run
    end

    private ######################################################################

    def build_data
      @data = model.connection.exec_query(statement.to_sql).to_a
      apply_dimension_callbacks
      format_data unless @data_format == :standard
      @data
    end

    def format_data
      case @data_format
      when :grouped
        if @dimensions.any?
          dimension_label_names = @dimensions.map { |d| d.label_name.to_s }
          @data = Hash[@data.map { |r| [ r.fetch_values(*dimension_label_names), r.fetch(@metric.name.to_s)] }]
        else
          @data = Hash[@data.map { |r| [ r.keys, r.fetch(@metric.name.to_s)] }]
        end
      else
        raise UnknownDataFormat
      end
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
        joins: dimension_joins(ReportingDimension::JOIN_METHODS[:joins]),
        left_outer_joins: dimension_joins(ReportingDimension::JOIN_METHODS[:left_outer_joins]),
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

    def dimension_joins(join_method)
      @dimensions.select { |d| d.type == Dimension::TYPES[:standard] && d.join_method == join_method }.
                  map { |d| d.name.to_sym }
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
        key = "#{dimension.name}_#{dimension.label}"
        @data.each do |hash|
          hash[key] = callback.call(hash[key])
        end
      end
    end
  end
end
