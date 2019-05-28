source 'https://rubygems.org'
# Specify your gem's dependencies in active_reporting.gemspec
gemspec

gem 'simplecov', require: false

rails = ENV['RAILS'] || '5-2'
db = ENV['DB'] || 'sqlite'

case rails
when '4-1'
  gem 'activerecord', '~> 4.1.0'
when '4-2'
  gem 'activerecord', '~> 4.2.0'
when '5-1'
  gem 'activerecord', '~> 5.1.0'
else
  gem 'activerecord', '~> 5.2.0'
end

if rails == "4-1" || rails == "4-2"
  if ENV['DB'] == 'pg'
    gem 'pg', '~> 0.18'
  end
  if ENV['DB'] == 'mysql'
    gem 'mysql2', '~> 0.3.18'
  end
end
