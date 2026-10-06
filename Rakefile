# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test

namespace :db do
  desc 'Create the test database for ENV["DB"] (pg, mysql, or trilogy; sqlite needs none)'
  task :create do
    require 'active_record'
    require 'active_record/database_configurations'
    require_relative 'test/support/database'
    next puts 'DB=sqlite uses an in-memory database; nothing to create.' if TestDatabase.db == 'sqlite'

    config = ActiveRecord::DatabaseConfigurations::HashConfig.new('test', 'primary', TestDatabase.config)
    ActiveRecord::Tasks::DatabaseTasks.create(config)
  end
end
