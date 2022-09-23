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
    assert data.all? { |r| r['released_on_quarter'].to_s.match(/\AQ\d+/) }
  end

  def test_report_runs_with_an_aggregate_other_than_count
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: SaleFactModel, dimensions: [:item], aggregate: :sum)
    report = ActiveReporting::Report.new(metric)
    data   = report.run

    refute data.empty?
    assert data.all? { |r| r.key?('a_metric') }
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

  ### test_data_format_grouped
  # The standard data format returns an array of hashes (records).
  # Specifying 'data_format: grouped' should return  metric values grouped by metric dimensions e.g.
  # ----- Data Format: Standard -----
  # [{"a_metric"=>26, "platform"=>"3DS"}, {"a_metric"=>1, "platform"=>"Switch"}, {"a_metric"=>20, "platform"=>"Wii U"}]
  # ----- Data Format: Grouped -----
  # {["3DS"]=>26, ["Switch"]=>1, ["Wii U"]=>20}
  def test_data_format_grouped_single_dimension
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: GameFactModel, dimensions: [:platform], aggregate: :count)
    standard_report = ActiveReporting::Report.new(metric, dimension_identifiers: false)
    standard_data = standard_report.run
    assert standard_data.is_a?(Array)

    grouped_report = ActiveReporting::Report.new(metric, dimension_identifiers: false, data_format: :grouped)
    grouped_data = grouped_report.run
    assert grouped_data.is_a?(Hash)

    # Group the standard result so we can check we have the right result
    metric_name = metric.instance_variable_get(:@name)
    dimension_names = standard_report.instance_variable_get(:@dimensions).map { |d| d.instance_variable_get(:@label_name).to_s }
    standard_grouped = Hash[standard_data.map { |r| [ r.fetch_values(*dimension_names), r.fetch(metric_name.to_s)] }]

    assert_equal standard_grouped, grouped_data
  end

  def test_run_with_a_block
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: GameFactModel, dimensions: [:platform], aggregate: :count)
    report = ActiveReporting::Report.new(metric, dimension_identifiers: false)
    standard_data = report.run
    assert standard_data.is_a?(Array)

    grouped_data = report.run do |metric, dimensions, data|
      if dimensions.any?
        dimension_label_names = dimensions.map { |d| d.label_name.to_s }
        Hash[data.map { |r| [ r.fetch_values(*dimension_label_names), r.fetch(metric.name.to_s)] }]
      else
        Hash[data.map { |r| [ r.keys, r.fetch(metric.name.to_s)] }]
      end
    end
    assert grouped_data.is_a?(Hash)

    # Group the standard result so we can check we have the right result
    metric_name = metric.instance_variable_get(:@name)
    dimension_names = report.instance_variable_get(:@dimensions).map { |d| d.instance_variable_get(:@label_name).to_s }
    standard_grouped = Hash[standard_data.map { |r| [ r.fetch_values(*dimension_names), r.fetch(metric_name.to_s)] }]
    assert_equal standard_grouped, grouped_data
  end
end
