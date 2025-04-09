source 'https://rubygems.org'
# Specify your gem's dependencies in active_reporting.gemspec
gemspec

gem 'simplecov', require: false

rails = ENV['RAILS'] || '8.0'
# db = ENV['DB'] || 'sqlite'

case rails
when '8.0'
  gem 'activerecord', '~> 8.0.0'
when '7.2'
  gem 'activerecord', '~> 7.2.0'
end
