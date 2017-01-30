$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

begin
  require 'simplecov'
  SimpleCov.start
rescue LoadError
end

require 'active_reporting'
require 'faker'
require 'minitest/autorun'
require 'minitest/pride'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

require 'schema'
require 'models'
require 'seed'
require 'fact_models'
