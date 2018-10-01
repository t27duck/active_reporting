require 'test_helper'

class ActiveReporting::FunctionAdapters::MysqlTest < Minitest::Test
  def adapter
    ActiveReporting::FunctionAdapters::Mysql
  end
  # Postgres and Ruby follow ISO standards for Monday being the start of
  # the week -- Postgres' `date_trunc` function follows that convention.
  # Here we test that our MySQL port does the same.
  #
  def test_date_trunc_returns_monday_for_week_start
    return unless 'mysql' == ENV['DB']
    if adapter.date_trunc_function_exists?
      ActiveRecord::Base.connection.execute(
        'DROP FUNCTION IF EXISTS ACTIVE_REPORTING_DATE_TRUNC'
      )
    end
    adapter.create_date_trunc_function
    stmt = ActiveReporting::FunctionAdapters::Mysql._active_reporting_date_trunc(
      'week', "TIMESTAMP '#{Date.parse('2018-09-29').beginning_of_day.strftime('%F %T')}'"
    )
    result = ActiveRecord::Base.connection.exec_query("SELECT #{stmt} AS foo")
    assert result.first['foo'].to_s == '2018-09-24 00:00:00 UTC' # A Monday
  end
end
