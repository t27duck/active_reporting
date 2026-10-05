# frozen_string_literal: true

module ActiveReporting
  # Builds the SQL used to drill a datetime column to a given level of a datetime hierarchy
  module DatetimeDrill
    # Adapters that support datetime drills, keyed by the adapter class to look for in the connection's
    # ancestry. Matching on ancestry covers adapters built on top of these, e.g. PostGIS and Trilogy.
    ADAPTERS = {
      'ActiveRecord::ConnectionAdapters::PostgreSQLAdapter' => :postgresql,
      'ActiveRecord::ConnectionAdapters::AbstractMysqlAdapter' => :mysql,
      'ActiveRecord::ConnectionAdapters::SQLite3Adapter' => :sqlite
    }.freeze

    module_function

    # The datetime drill flavor for a connection, or nil if datetime drills are not supported for it
    #
    # @param connection [ActiveRecord::ConnectionAdapters::AbstractAdapter]
    # @return [Symbol, nil] :postgresql, :mysql, or :sqlite
    def adapter_for(connection)
      connection.class.ancestors.filter_map { |ancestor| ADAPTERS[ancestor.name] }.first
    end

    # @param adapter [Symbol] as returned by `adapter_for`
    # @param drill [Symbol, String] one of `ReportingDimension::DATETIME_HIERARCHIES`
    # @param column [String] the quoted column to drill
    # @return [String] SQL fragment
    def fragment(adapter, drill, column)
      public_send(adapter, drill, column)
    end

    def postgresql(drill, column)
      case drill.to_sym
      when :date
        "DATE(#{column})"
      else
        "DATE_TRUNC('#{drill}', #{column})"
      end
    end

    def mysql(drill, column)
      case drill.to_sym
      when :microseconds
        "MICROSECOND(#{column})"
      when :milliseconds
        "MICROSECOND(#{column}) DIV 1000"
      when :second
        "SECOND(#{column})"
      when :minute
        "MINUTE(#{column})"
      when :hour
        "HOUR(#{column})"
      when :day
        "DAY(#{column})"
      when :week
        "WEEKDAY(#{column})"
      when :month
        "MONTH(#{column})"
      when :quarter
        "QUARTER(#{column})"
      when :year
        "YEAR(#{column})"
      when :decade
        "YEAR(#{column}) DIV 10"
      when :century
        "YEAR(#{column}) DIV 100"
      when :millennium
        "YEAR(#{column}) DIV 1000"
      when :date
        "DATE(#{column})"
      end
    end

    # Mirrors Postgres' `date_trunc`, returning the truncated datetime as 'YYYY-MM-DD HH:MM:SS' text
    def sqlite(drill, column)
      year = "CAST(STRFTIME('%Y', #{column}) AS INTEGER)"
      case drill.to_sym
      when :microseconds then column
      # STRFTIME's %f rounds to the nearest millisecond, so truncate the stored fraction directly
      when :milliseconds then "STRFTIME('%Y-%m-%d %H:%M:%S', #{column}) || SUBSTR(#{column} || '.000', 20, 4)"
      when :second then "STRFTIME('%Y-%m-%d %H:%M:%S', #{column})"
      when :minute then "STRFTIME('%Y-%m-%d %H:%M:00', #{column})"
      when :hour then "STRFTIME('%Y-%m-%d %H:00:00', #{column})"
      when :day then "STRFTIME('%Y-%m-%d 00:00:00', #{column})"
      when :week then "STRFTIME('%Y-%m-%d 00:00:00', #{column}, '-6 days', 'weekday 1')"
      when :month then "STRFTIME('%Y-%m-01 00:00:00', #{column})"
      when :quarter
        "PRINTF('%04d-%02d-01 00:00:00', #{year}, (CAST(STRFTIME('%m', #{column}) AS INTEGER) - 1) / 3 * 3 + 1)"
      when :year then "STRFTIME('%Y-01-01 00:00:00', #{column})"
      when :decade then "PRINTF('%04d-01-01 00:00:00', #{year} / 10 * 10)"
      when :century then "PRINTF('%04d-01-01 00:00:00', (#{year} - 1) / 100 * 100 + 1)"
      when :millennium then "PRINTF('%04d-01-01 00:00:00', (#{year} - 1) / 1000 * 1000 + 1)"
      when :date then "DATE(#{column})"
      end
    end
  end
end
