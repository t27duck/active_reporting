source 'https://rubygems.org'
# Specify your gem's dependencies in active_reporting.gemspec
gemspec

rails = ENV.fetch('RAILS', '8.1')
gem 'activerecord', "~> #{rails}.0"
gem 'activesupport', "~> #{rails}.0"

gem 'minitest'
gem 'rake'
gem 'ransack'
gem 'rubocop', '~> 1.0', require: false
gem 'simplecov', require: false

# Only the adapter for the database under test is installed, so contributors
# don't need every database's client libraries. Re-run `bundle install` after
# changing DB.
case ENV.fetch('DB', 'sqlite')
when 'pg'
  gem 'pg'
when 'mysql'
  gem 'mysql2'
else
  gem 'sqlite3'
end
