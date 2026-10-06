# frozen_string_literal: true

source 'https://rubygems.org'
# Specify your gem's dependencies in active_reporting.gemspec
gemspec

rails = ENV.fetch('RAILS', '8.1')
gem 'activerecord', "~> #{rails}.0"
gem 'activesupport', "~> #{rails}.0"
gem 'railties', "~> #{rails}.0" # to test code reloading in a Rails app

gem 'minitest'
gem 'rake'
gem 'ransack'
gem 'rubocop', '~> 1.72', require: false
gem 'rubocop-minitest', require: false
gem 'rubocop-rake', require: false
gem 'simplecov', require: false

gem 'sqlite3' # the default test database

# Adapters for the other test databases are opt-in, so contributors don't need every database's
# client libraries. `DB=pg bin/setup` enables the group for the chosen database, or enable it with
# `bundle config set --local with pg` (or mysql, trilogy).
group :pg, optional: true do
  gem 'pg'
end

group :mysql, optional: true do
  gem 'mysql2'
end

group :trilogy, optional: true do
  gem 'trilogy'
end
