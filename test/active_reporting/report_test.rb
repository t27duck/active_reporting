require 'test_helper'

class ActiveReporting::ReportTest < Minitest::Test
  def setup
    @metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:kind])
    @report = ActiveReporting::Report.new(@metric)
  end

  def users_created_in_different_testable_time_periods
    t = User.last.created_at # Existing seed users a good reference point
    users = [User.create(username: 'user_minute', created_at: t - 1.minute)]
    users << User.create(username: 'user_hour', created_at: t - 1.hour)
    users << User.create(username: 'user_day', created_at: t - 1.day)
    users << User.create(username: 'user_week', created_at: t - 1.week)
    users << User.create(username: 'user_month', created_at: t - 1.month)
    users << User.create(username: 'user_quarter', created_at: t - 3.months)
    users << User.create(username: 'user_year', created_at: t - 1.year)
    users << User.create(username: 'user_decade', created_at: t - 10.years)
    users << User.create(username: 'user_century', created_at: t - 100.years)
    users << User.create(username: 'user_millennium', created_at: t - 1000.years)
  end

  def datetime_testable_periods
    %i[minute hour day week month quarter year decade century millennium]
  end

  def test_run_returns_an_array
    assert @report.run.is_a?(Array), 'result is not an array'
  end

  def test_result_contains_the_metric_name
    assert @report.run.all? { |r| r.key?(@metric.name.to_s) }, 'metric name not included'
  end

  def test_result_contains_the_processed_dimension_callback
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: ReleaseDateFactModel, dimensions: [{released_on: :quarter}])
    report = ActiveReporting::Report.new(metric)
    data   = report.run

    refute data.empty?
    assert data.all? { |r| r['released_on'].to_s.match(/\AQ\d+/) }
  end

  def test_report_runs_with_an_aggregate_other_than_count
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: SaleFactModel, dimensions: [:item], aggregate: :sum)
    report = ActiveReporting::Report.new(metric)
    data   = report.run

    refute data.empty?
    assert data.all? { |r| r.key?('a_metric') }
  end

  def test_report_runs_with_a_date_grouping
    if %w[pg mysql].include?(ENV['DB'])
      users = users_created_in_different_testable_time_periods
      # Based on the 5 users created in seed.rb and the 10 just created,
      # we can expect 11 different data segments when dimensioning by minute.
      expected_result_size_when_dimensioning_by_minute = 11
      datetime_testable_periods.each_with_index do |period, i|
        metric = ActiveReporting::Metric.new(
          :a_metric,
          fact_model: UserFactModel,
          dimensions: [{created_at: period}]
        )
        report = ActiveReporting::Report.new(metric)
        data = report.run
        assert data.all? { |r| r.key?("created_at_#{period}") }
        # As we expand the time period dimension, we can expect one less result
        assert data.size == expected_result_size_when_dimensioning_by_minute - i
      end
      users.each(&:destroy!) # Cleanup
    else
      assert_raises ActiveReporting::InvalidDimensionLabel do
        metric = ActiveReporting::Metric.new(:a_metric, fact_model: UserFactModel, dimensions: [{created_at: :month}])
        report = ActiveReporting::Report.new(metric)
      end
    end
  end
end
