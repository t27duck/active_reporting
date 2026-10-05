source 'https://rubygems.org'
# Specify your gem's dependencies in active_reporting.gemspec
gemspec

gem 'simplecov', require: false

rails = ENV['RAILS'] || '8.1'
# db = ENV['DB'] || 'sqlite'

case rails
when '8.1'
  gem 'activerecord', '~> 8.1.0'
end
