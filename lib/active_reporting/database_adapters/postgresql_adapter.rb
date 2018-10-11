# frozen_string_literal: true

module ActiveReporting
  module DatabaseAdapters
    class PostgresqlAdapter < Base
      # Values for the Postgres `date_trunc` method.
      # See https://www.postgresql.org/docs/10/static/functions-datetime.html#FUNCTIONS-DATETIME-TRUNC

      # Generate SQL snippet with DATE_TRUNC
      # @param [String] interval
      # @param [String] field
      # @return [String]
      def date_trunc(interval, field)
        "DATE_TRUNC('#{interval}', #{field})"
      end

      protected

      def datetime_hierarchies
        @datetime_hierarchies ||= %i[
          microseconds
          milliseconds
          second
          minute
          hour
          day
          week
          month
          quarter
          year
          decade
          century
          millennium
        ]
      end
    end
  end
end
