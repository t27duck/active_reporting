require 'test_helper'

class ActiveReporting::FunctionAdapters::MysqlTest < Minitest::Test
  def setup
    mysql_setup if mysql?
  end

  def mysql?
    'mysql' == ENV['DB']
  end

  def mysql_setup
    if adapter.date_trunc_function_exists?
      ActiveRecord::Base.connection.execute(
        'DROP FUNCTION IF EXISTS ACTIVE_REPORTING_DATE_TRUNC'
      )
    end
    adapter.create_date_trunc_function
  end

  def adapter
    ActiveReporting::FunctionAdapters::Mysql
  end

  # Postgres and Ruby follow ISO standards for Monday being the start of
  # the week -- Postgres' `date_trunc` function follows that convention.
  # Here we test that our MySQL port does the same.
  #
  def test_date_trunc_returns_monday_for_week_start
    return unless mysql?
    date = Date.parse('2018-09-29').beginning_of_day.strftime('%F %T')
    stmt = adapter._active_reporting_date_trunc(
      'week', "TIMESTAMP '#{date}'"
    )
    result = ActiveRecord::Base.connection.exec_query("SELECT #{stmt} AS foo")
    assert result.first['foo'].to_s == '2018-09-24 00:00:00 UTC' # A Monday
  end

  def test_week_truncation_when_date_is_a_sunday
    return unless mysql?
    date = Date.parse('2018-06-03').beginning_of_day.strftime('%F %T')
    stmt = adapter._active_reporting_date_trunc(
      'week', "TIMESTAMP '#{date}'"
    )
    result = ActiveRecord::Base.connection.exec_query("SELECT #{stmt} AS foo")
    assert result.first['foo'].to_s == '2018-05-28 00:00:00 UTC' # The prior monday
  end
end
