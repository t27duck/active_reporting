require 'forwardable'
module ActiveReporting
  class Report
    extend Forwardable
    def_delegators :@metric, :fact_model, :model
    def_delegators :statement, :to_sql

    def initialize(metric, dimension_identifiers: true)
      @metric                 = metric
      @dimension_identifiers  = dimension_identifiers
      @dimensions             = metric.dimensions
    end

    def run
      model.connection.execute to_sql
    end

    private ######################################################################

    def statement
      parts = {
        select: select_statement,
        joins: dimension_joins,
        group: group_by_statement
      }

      ([model] + parts.keys).inject do |chain, method|
        chain.public_send(method, parts[method])
      end
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
  end
end
