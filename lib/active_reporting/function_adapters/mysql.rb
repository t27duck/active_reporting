# frozen_string_literal: true

module ActiveReporting
  module FunctionAdapters
    module Mysql
      # The list of available datetime values.
      #
      # @return [Array<Symbol>]
      #
      def self.datetime_precision_values
        %i[microsecond millisecond second minute hour day week month quarter year decade
           century millennium].freeze
      end

      # Whether the arg value is supported as a viable datetime
      # value for performing datetime functions.
      #
      def self.valid_datetime_precision_value?(value)
        datetime_precision_values.include?(value)
      end

      # Generate a date truncation statement in MySQL
      # See https://www.postgresql.org/docs/10/static/functions-datetime.html#FUNCTIONS-DATETIME-TRUNC
      #
      # @param [String, Symbol] datetime_precision_value
      # @param [String] quoted_table_name
      # @param [String] column_name
      #
      def self.date_truncate(datetime_precision_value, quoted_table_name, column_name)
        create_date_trunc_function unless date_trunc_function_exists?
        _active_reporting_date_trunc(datetime_precision_value, "#{quoted_table_name}.#{column_name}")
      end

      def self._active_reporting_date_trunc(datetime_precision_value, value)
        "ACTIVE_REPORTING_DATE_TRUNC('#{datetime_precision_value}', #{value})"
      end

      def self.date_trunc_function_exists?
        ActiveRecord::Base.connection.execute(
          <<-SQL
            SELECT ROUTINE_NAME
            FROM INFORMATION_SCHEMA.ROUTINES
            WHERE ROUTINE_TYPE="FUNCTION"
            AND UCASE(ROUTINE_NAME) = 'ACTIVE_REPORTING_DATE_TRUNC';
          SQL
        ).first.present?
      end

      def self.create_date_trunc_function
        ActiveRecord::Base.connection.execute(
          <<-SQL
            CREATE FUNCTION ACTIVE_REPORTING_DATE_TRUNC(field ENUM('microsecond', 'millisecond', 'second', 'minute', 'hour', 'day', 'week', 'month', 'quarter', 'year', 'decade', 'century', 'millennium'), source datetime(6))
            RETURNS datetime(6)
            DETERMINISTIC
            BEGIN
              -- Short-circuit in the week, month, or year, since those computations are straightforward
              IF field IN ('week') THEN RETURN STR_TO_DATE(CONCAT(YEARWEEK(source, 2), ' Monday'), '%X%V %W'); END IF;
              IF field IN ('month') THEN RETURN DATE_FORMAT(source, '%Y-%m-01'); END IF;
              IF field IN ('year') THEN RETURN DATE_FORMAT(source, '%Y-01-01'); END IF;

              -- Otherwise, we need to build the appropriate result
              IF field IN ('millisecond') THEN SET source = source - INTERVAL MICROSECOND(source) % 1000 MICROSECOND; END IF;
              IF field NOT IN ('microsecond', 'millisecond') THEN SET source = source - INTERVAL MICROSECOND(source) MICROSECOND; END IF;
              IF field NOT IN ('microsecond', 'millisecond', 'second') THEN SET source = source - INTERVAL SECOND(source) SECOND; END IF;
              IF field NOT IN ('microsecond', 'millisecond', 'second', 'minute') THEN SET source = source - INTERVAL MINUTE(source) MINUTE; END IF;
              IF field NOT IN ('microsecond', 'millisecond', 'second', 'minute', 'hour') THEN SET source = source - INTERVAL HOUR(source) HOUR; END IF;
              IF field NOT IN ('microsecond', 'millisecond', 'second', 'minute', 'hour', 'day') THEN SET source = source - INTERVAL DAYOFWEEK(source) - 1 DAY; END IF;
              IF field NOT IN ('microsecond', 'millisecond', 'second', 'minute', 'hour', 'day', 'week') THEN SET source = source - INTERVAL DAY(source) - 1 DAY; END IF;
              IF field IN ('quarter') THEN SET source = source - INTERVAL MONTH(source) % 3 - 1 MONTH; END IF;
              IF field NOT IN ('microsecond', 'millisecond', 'second', 'minute', 'hour', 'week', 'day', 'month', 'quarter') THEN SET source = source - INTERVAL MONTH(source) - 1 MONTH; END IF;

              -- Year ranges go from 1 - 10, e.g. 1961-1970, not 1960-1969. The third millenium started 2001, not 2000. If you want it the other way, remove the "- 1" from each of the following.
              IF field IN ('decade') THEN SET source = source - INTERVAL YEAR(source) % 10 - 1 YEAR; END IF;
              IF field IN ('century') THEN SET source = source - INTERVAL YEAR(source) % 100  - 1 YEAR; END IF;
              IF field IN ('millennium') THEN SET source = source - INTERVAL YEAR(source) % 1000 - 1 YEAR; END IF;
              RETURN source;
            END
          SQL
        )
      end
    end
  end
end
