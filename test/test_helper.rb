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
  db_config = { adapter: 'postgresql', database: 'active_reporting_test', min_messages: 'warning' }
  db_config[:username] = ENV['POSTGRES_USER'] if ENV.key?('POSTGRES_USER')
  db_config[:password] = ENV['POSTGRES_PASSOWRD'] if ENV.key?('POSTGRES_PASSWORD')
  db_config[:host] = ENV['POSTGRES_HOST'] if ENV.key?('POSTGRES_HOST')
  ActiveRecord::Base.establish_connection(**db_config)
when 'mysql'
  db_config = { adapter:  'mysql2', database: 'active_reporting_test', encoding: 'utf8' }
  db_config[:host] = ENV['MYSQL_HOST'] if ENV.key?('MYSQL_HOST')
  ActiveRecord::Base.establish_connection(**db_config)
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
