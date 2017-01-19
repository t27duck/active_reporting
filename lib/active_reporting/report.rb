require 'forwardable'
module ActiveReporting
  class Report
    extend Forwardable
    def_delegators :@metric, :fact_model, :model

    def initialize(metric, dimension_identifiers: true, dimension_filter: {})
      @metric                 = metric
      @dimension_identifiers  = dimension_identifiers
      @dimensions             = metric.dimensions
      partition_dimension_filters dimension_filter
    end

    # Builds and executes a query, returning the raw result
    #
    # @return [Array]
    def run
      model.connection.execute(statement.to_sql).to_a
    end

    private ######################################################################

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
        group: group_by_statement
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
        raise UnknownAggregate.new(@metric.aggregate)
      end
    end

    def dimension_joins
      @metric.dimensions.select { |d| d.type == :standard }.map(&:name)
    end

    def group_by_statement
      @metric.dimensions.map { |d| d.group_by_statement(with_identifier: @dimension_identifiers) }
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
      @dimension_filters[:lambda].each do |dm, args|
        chain = if [true, 'true'].include?(args)
                  chain.scoping { model.instance_exec(&dm.lambda) }
                else
                  chain.scoping { model.instance_exec(args, &dm.lambda) }
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
  end
end
