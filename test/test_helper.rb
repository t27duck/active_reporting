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
db_user = ENV['DB_USER']
case db
when 'pg'
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    database: 'active_reporting_test',
    # username: 'postgres', # Uncomment if you need this
    # password: 'postgres', # Uncomment if you need this
    min_messages: 'warning'
  )
  ActiveReporting::Configuration.db_adapter = :postgresql
when 'mysql'
  ActiveRecord::Base.establish_connection(
    adapter:  'mysql2',
    database: 'active_reporting_test',
    encoding: 'utf8',
    username: db_user
  )
  ActiveReporting::Configuration.db_adapter = :mysql2
when 'sqlite'
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:'
  )
else
  raise "Unknown ENV['DB']: '#{db}'"
end

# Check in spec if it's a valid adapter
def valid_db_adapter?
  ENV['DB'] == 'pg' || ENV['DB'] == 'mysql'
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
