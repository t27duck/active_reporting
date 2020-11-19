source 'https://rubygems.org'
# Specify your gem's dependencies in active_reporting.gemspec
gemspec

gem 'simplecov', require: false

rails = ENV['RAILS'] || '5.2'
db = ENV['DB'] || 'sqlite'

case rails
when '5.2'
  gem 'activerecord', '~> 5.2.0'
when '6.0'
  gem 'activerecord', '~> 6.0.0'
end
