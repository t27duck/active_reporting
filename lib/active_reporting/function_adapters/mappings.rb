require 'active_reporting/function_adapters/postgresql'
require 'active_reporting/function_adapters/mysql'

module ActiveReporting
  module FunctionAdapters
    MAPPINGS = {
      'PostgreSQL' => Postgresql,
      'PostGIS' => Postgresql,
      'Mysql2' => Mysql
    }.freeze
  end
end
