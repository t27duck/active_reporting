source 'https://rubygems.org'
# Specify your gem's dependencies in active_reporting.gemspec
gemspec

gem 'simplecov', require: false

rails = ENV['RAILS'] || '5-0'

case rails
when '4-2'
  gem 'activerecord', '~> 4.2.0'
else
  gem 'activerecord', '~> 5.0.0'
end
