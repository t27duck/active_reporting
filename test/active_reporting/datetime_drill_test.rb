require 'test_helper'
require 'active_record/connection_adapters/abstract_mysql_adapter'

class ActiveReporting::DatetimeDrillTest < Minitest::Test
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
