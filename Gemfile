source 'https://rubygems.org'
# Specify your gem's dependencies in active_reporting.gemspec
gemspec

gem 'simplecov', require: false

rails = ENV['RAILS'] || '5-1'

case rails
when '4-2'
  gem 'activerecord', '~> 4.2.0'
when '5-0'
  gem 'activerecord', '~> 5.0.0'
else
  gem 'activerecord', '~> 5.1.0'
end
