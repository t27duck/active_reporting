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
when 'mysql'
  ActiveRecord::Base.establish_connection(
    adapter:  'mysql2',
    database: 'active_reporting_test',
    username: 'Nick',
    password: 'password',
    encoding: 'utf8'
  )
when 'sqlite'
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:'
  )
else
  raise "Unknown ENV['DB']: '#{db}'"
end

require 'schema'
require 'models'
require 'fact_models'
require 'seed'

class Metric
  @metrics = {
    a_metric: ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel)
  }
  def self.lookup(name)
    @metrics[name.to_sym]
  end
end
