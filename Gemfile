source 'https://rubygems.org'
# Specify your gem's dependencies in active_reporting.gemspec
gemspec

gem 'simplecov', require: false

rails = ENV['RAILS'] || '6.1'
db = ENV['DB'] || 'sqlite'

case rails
when '6.1'
  gem 'activerecord', '~> 6.1.0'
when '7.0'
  gem 'activerecord', '~> 7.0.0'
when '7.1'
  gem 'activerecord', '~> 7.1.0'
end
