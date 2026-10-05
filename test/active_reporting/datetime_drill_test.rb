require 'test_helper'
require 'active_record/connection_adapters/abstract_mysql_adapter'

class ActiveReporting::DatetimeDrillTest < Minitest::Test
  include DateTruncHelper

  EDGE_CASES = [
    Time.utc(2023, 12, 31, 23, 59, 59.999999r), # Sunday, end of year, rounds up if not truncated
    Time.utc(2000, 2, 29, 12, 34, 56.123456r),  # leap day; centuries and millennia start in year 1
    Time.utc(2001, 1, 1, 0, 0, 0.0005r),        # first instant of a century and millennium
    Time.utc(1999, 7, 4, 6, 7, 8)               # no fractional seconds
  ].freeze

  def test_every_drill_truncates_edge_cases_like_date_trunc
    adapter = ActiveReporting::DatetimeDrill.adapter_for(ActiveRecord::Base.connection)
    column = "#{User.quoted_table_name}.#{User.connection.quote_column_name('created_at')}"

    User.transaction do
      ids = EDGE_CASES.map { |t| User.create!(username: 'edge', created_at: t).id }

      ActiveReporting::ReportingDimension::DATETIME_HIERARCHIES.each do |drill|
        sql = ActiveReporting::DatetimeDrill.fragment(adapter, drill, column)
        actual = User.where(id: ids).order(:id).pluck(Arel.sql(sql)).map { |v| cast_time(v) }
        assert_equal EDGE_CASES.map { |t| date_trunc(drill, t) }, actual, "datetime_drill: #{drill}"
      end
      raise ActiveRecord::Rollback
    end
  end
  def test_adapter_for_detects_the_test_database
    expected = { 'pg' => :postgresql, 'mysql' => :mysql, 'trilogy' => :mysql, 'sqlite' => :sqlite }.fetch(ENV['DB'] || 'sqlite')
    assert_equal expected, ActiveReporting::DatetimeDrill.adapter_for(ActiveRecord::Base.connection)
  end

  # e.g. PostGIS subclasses the PostgreSQL adapter
  def test_adapter_for_detects_subclasses_of_supported_adapters
    subclass = Class.new(ActiveRecord::Base.connection.class)
    assert_equal ActiveReporting::DatetimeDrill.adapter_for(ActiveRecord::Base.connection),
                 ActiveReporting::DatetimeDrill.adapter_for(subclass.allocate)
  end

  # Mysql2Adapter and TrilogyAdapter both subclass AbstractMysqlAdapter
  def test_adapter_for_detects_any_mysql_adapter
    mysql_adapter = Class.new(ActiveRecord::ConnectionAdapters::AbstractMysqlAdapter)
    assert_equal :mysql, ActiveReporting::DatetimeDrill.adapter_for(mysql_adapter.allocate)
  end

  def test_adapter_for_returns_nil_for_unsupported_adapters
    unsupported = Class.new(ActiveRecord::ConnectionAdapters::AbstractAdapter)
    assert_nil ActiveReporting::DatetimeDrill.adapter_for(unsupported.allocate)
  end
end
