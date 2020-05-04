# frozen_string_literal: true

module ActiveReporting
  module DatabaseAdapters
    class Factory
      class << self
        ADAPTERS = {
          sqlite3: SqliteAdapter,
          mysql2: MysqlAdapter,
          postgresql: PostgresqlAdapter,
          postgis: PostgresqlAdapter
        }.freeze
        # @param [Symbol]
        def for_database(adapter_name)
          adapter = ADAPTERS[adapter_name]

          return adapter.new(adapter_name) unless adapter.nil?

          raise(
            DatabaseNotSupported,
            "Database with this #{adapter_name} is not supported by ActiveReporting"
          )
        end
      end
    end
  end
end
