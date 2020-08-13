require 'test_helper'

class ActiveReporting::ReportTest < Minitest::Test
  def setup
    @metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:kind])
    @report = ActiveReporting::Report.new(@metric)
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

  def test_report_runs_with_a_year_grouping
    if ENV['DB'] == 'pg'
      metric = ActiveReporting::Metric.new(
        :a_metric,
        fact_model: UserFactModel,
        dimensions: [{birthday_on: :year}]
      )
      report = ActiveReporting::Report.new(metric)
      data = report.run
      assert data.all? { |r| r.key?('birthday_on_year') }
      assert data.size == 5
    else
      assert_raises ActiveReporting::InvalidDimensionLabel do
        metric = ActiveReporting::Metric.new(
          :a_metric,
          fact_model: UserFactModel,
          dimensions: [{birthday_on: :year}]
        )
        report = ActiveReporting::Report.new(metric)
      end
    end
  end

  def test_report_runs_with_a_date_grouping
    if ['pg','mysql'].include?(ENV['DB'])
      metric = ActiveReporting::Metric.new(:a_metric, fact_model: UserFactModel, dimensions: [{created_at: :month}])
      report = ActiveReporting::Report.new(metric)
      data = report.run
      assert data.all? { |r| r.key?('created_at_month') }
      assert data.size == 5
    else
      assert_raises ActiveReporting::InvalidDimensionLabel do
        metric = ActiveReporting::Metric.new(:a_metric, fact_model: UserFactModel, dimensions: [{created_at: :month}])
        report = ActiveReporting::Report.new(metric)
      end
    end
  end

  def test_accept_dimension_join_method_option
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: GameFactModel, dimensions: [{ platform: { join_method: :left_outer_joins }}], aggregate: :sum)
    report = ActiveReporting::Report.new(metric)
    assert report.send(:statement).to_sql.include?("LEFT OUTER JOIN")
  end
end
