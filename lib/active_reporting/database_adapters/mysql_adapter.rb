# frozen_string_literal: true

module ActiveReporting
  module DatabaseAdapters
    # Database adapters are here to solve SQL problems in the
    # most idiomatic way in each database
    class MysqlAdapter < Base
      # Generate SQL snippet with DATE_TRUNC
      # @param [String] interval
      # @param [String] field
      # @return [String]
      def date_trunc(interval, field)
        clean_sql(
          <<-SQL
            DATE_ADD(
              "#{super_old_base_date}",
              INTERVAL TIMESTAMPDIFF(
                #{interval.upcase},
                "#{super_old_base_date}",
                #{field}
              ) #{interval.upcase}
            )
          SQL
        )
      end

      protected

      # Remove spaces and put all in one line
      def clean_sql(sql)
        sql
          .strip
          .gsub(/\n+/, ' ')
          .gsub(/\s+/, ' ')
          .gsub(/\(\s+\)/, '(')
          .gsub(/\)\s+\)/, ')')
      end

      def datetime_hierarchies
        @datetime_hierarchies ||= %i[
          year
          month
          week
        ]
      end

      # Used to generate a diff when implementing
      # datetime truncation
      #
      # @return [String]
      def super_old_base_date
        '1900-01-01'
      end
    end
  end
end
