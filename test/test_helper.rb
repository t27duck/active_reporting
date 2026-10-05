$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

begin
  require 'simplecov'
  SimpleCov.start
rescue LoadError
end

require 'active_reporting'

require 'minitest/autorun'

db = ENV['DB'] || 'sqlite'
case db
when 'pg'
  db_config = { adapter: 'postgresql', database: 'active_reporting_test', min_messages: 'warning' }
  db_config[:username] = ENV['POSTGRES_USER'] if ENV.key?('POSTGRES_USER')
  db_config[:password] = ENV['POSTGRES_PASSWORD'] if ENV.key?('POSTGRES_PASSWORD')
  db_config[:host] = ENV['POSTGRES_HOST'] if ENV.key?('POSTGRES_HOST')
  ActiveRecord::Base.establish_connection(**db_config)
when 'mysql', 'trilogy'
  db_config = { adapter: db == 'mysql' ? 'mysql2' : 'trilogy', database: 'active_reporting_test', encoding: 'utf8' }
  db_config[:username] = ENV['MYSQL_USER'] if ENV.key?('MYSQL_USER')
  db_config[:host] = ENV['MYSQL_HOST'] if ENV.key?('MYSQL_HOST')
  db_config[:port] = ENV['MYSQL_PORT'] if ENV.key?('MYSQL_PORT')
  ActiveRecord::Base.establish_connection(**db_config)
when 'sqlite'
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:'
  )
else
  raise "Unknown ENV['DB']: '#{db}'"
end

module DateTruncHelper
  # Reference implementation of Postgres' `date_trunc` (and `DATE()` for :date)
  def date_trunc(drill, t)
    case drill
    when :microseconds then t
    when :milliseconds then t.floor(3)
    when :second then t.floor
    when :minute then Time.utc(t.year, t.month, t.day, t.hour, t.min)
    when :hour then Time.utc(t.year, t.month, t.day, t.hour)
    when :day, :date then Time.utc(t.year, t.month, t.day)
    when :week then Time.utc(t.year, t.month, t.day) - ((t.wday - 1) % 7).days
    when :month then Time.utc(t.year, t.month)
    when :quarter then Time.utc(t.year, ((t.month - 1) / 3 * 3) + 1)
    when :year then Time.utc(t.year)
    when :decade then Time.utc(t.year / 10 * 10)
    when :century then Time.utc(((t.year - 1) / 100 * 100) + 1)
    when :millennium then Time.utc(((t.year - 1) / 1000 * 1000) + 1)
    end
  end

  def cast_time(value)
    value = ActiveRecord::Type::DateTime.new.cast(value.to_s) unless value.is_a?(Time)
    value.utc
  end
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
