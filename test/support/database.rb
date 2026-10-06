# frozen_string_literal: true

# Connection settings for the test database chosen with ENV['DB'], shared by the tests and the
# `db:create` Rake task.
module TestDatabase
  NAME = 'active_reporting_test'

  # The Bundler group that installs the adapter gem for each database
  ADAPTER_GROUPS = { 'pg' => 'pg', 'mysql' => 'mysql', 'trilogy' => 'trilogy' }.freeze

  def self.db
    ENV.fetch('DB', 'sqlite')
  end

  def self.config
    case db
    when 'pg'
      { adapter: 'postgresql', database: NAME, min_messages: 'warning', username: ENV.fetch('POSTGRES_USER', nil),
        password: ENV.fetch('POSTGRES_PASSWORD', nil), host: ENV.fetch('POSTGRES_HOST', nil) }.compact
    when 'mysql', 'trilogy'
      { adapter: db == 'mysql' ? 'mysql2' : 'trilogy', database: NAME, encoding: 'utf8',
        username: ENV.fetch('MYSQL_USER', nil), host: ENV.fetch('MYSQL_HOST', nil),
        port: ENV.fetch('MYSQL_PORT', nil) }.compact
    when 'sqlite'
      { adapter: 'sqlite3', database: ':memory:' }
    else
      raise "Unknown ENV['DB']: '#{db}'. Use sqlite (default), pg, mysql, or trilogy."
    end
  end

  def self.connect
    ActiveRecord::Base.establish_connection(**config)
  rescue LoadError => e
    group = ADAPTER_GROUPS.fetch(db) { raise e }
    abort "The database adapter for DB=#{db} is not installed (#{e.message}).\n" \
          "Run `DB=#{db} bin/setup`, or `bundle config set --local with #{group}` and `bundle install`."
  end
end
