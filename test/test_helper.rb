$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

begin
  require 'simplecov'
  SimpleCov.start
rescue LoadError
end

require 'active_reporting'

require 'minitest/autorun'
require 'minitest/pride'

db = ENV['DB'] || 'sqlite'
case db
when 'pg'
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    database: 'active_reporting_test',
    # username: 'postgres', # Uncomment if you need this
    # password: 'postgres', # Uncomment if you need this
    min_messages: 'warning'
  )
when 'sqlite'
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
else
  raise "Unknown ENV['DB']: '#{db}'"
end

require 'fact_models'
require 'schema'
require 'models'
require 'seed'
