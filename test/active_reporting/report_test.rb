# frozen_string_literal: true

require 'test_helper'

class ActiveReporting::ReportTest < Minitest::Test
  include DateTruncHelper

  def setup
    @metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:kind])
    @report = ActiveReporting::Report.new(@metric)
  end

  def test_run_returns_an_array
    assert_kind_of Array, @report.run, 'result is not an array'
  end

  def test_report_query_is_named_and_uses_the_query_cache
    queries = []
    callback = ->(_name, _start, _finish, _id, payload) { queries << payload if payload[:name] == 'ActiveReporting' }
    ActiveSupport::Notifications.subscribed(callback, 'sql.active_record') do
      ActiveRecord::Base.cache do
        2.times { ActiveReporting::Report.new(@metric).run }
      end
    end

    assert_equal 2, queries.size
    refute queries.first[:cached]
    assert queries.last[:cached], 'second report run did not use the query cache'
  end

  def test_metric_name_is_quoted_in_the_query
    metric = ActiveReporting::Metric.new(:order, fact_model: FigureFactModel, dimensions: [:kind])
    data = ActiveReporting::Report.new(metric).run

    refute_empty data
    assert(data.all? { |r| r.key?('order') })
  end

  def test_report_applies_a_ransack_dimension_filter
    with_ransack_dimension_filter do
      data = ActiveReporting::Report.new(@metric, dimension_filter: { kind_cont: 'card' }).run

      refute_empty data
      assert(data.all? { |r| r['kind'].include?('card') })
    end
  end

  def test_ransack_dimension_filter_raises_when_ransack_is_not_available
    original = ActiveReporting::Configuration.ransack_available
    ActiveReporting::Configuration.ransack_available = false

    with_ransack_dimension_filter do
      assert_raises ActiveReporting::RansackNotAvailable do
        ActiveReporting::Report.new(@metric, dimension_filter: { kind_cont: 'card' }).run
      end
    end
  ensure
    ActiveReporting::Configuration.ransack_available = original
  end

  def test_result_contains_the_metric_name
    assert @report.run.all? { |r| r.key?(@metric.name.to_s) }, 'metric name not included'
  end

  def test_result_contains_the_processed_dimension_callback
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: ReleaseDateFactModel,
                                                    dimensions: [{ released_on: :quarter }])
    report = ActiveReporting::Report.new(metric)
    data   = report.run

    refute_empty data
    assert(data.all? { |r| r['released_on_quarter'].to_s.match(/\AQ\d+/) })
  end

  def test_dimension_callback_is_applied_to_a_custom_label_name
    dimensions = [{ released_on: { field: :quarter, name: :release_quarter } }]
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: ReleaseDateFactModel, dimensions: dimensions)
    data = ActiveReporting::Report.new(metric).run

    refute_empty data
    assert(data.all? { |r| r['release_quarter'].to_s.match(/\AQ\d+/) })
  end

  def test_dimension_callback_is_applied_to_a_standard_dimension_using_the_name_label
    with_dimension_label_callback(SeriesFactModel, :name, ->(n) { "Series: #{n}" }) do
      metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:series])
      data = ActiveReporting::Report.new(metric).run

      refute_empty data
      assert(data.all? { |r| r['series'].start_with?('Series: ') })
    end
  end

  def test_dimension_callback_is_applied_to_a_degenerate_dimension
    with_dimension_label_callback(FigureFactModel, :kind, lambda(&:upcase)) do
      metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:kind])
      data = ActiveReporting::Report.new(metric).run

      refute_empty data
      assert(data.all? { |r| r['kind'] == r['kind'].upcase })
    end
  end

  def test_report_runs_with_an_aggregate_other_than_count
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: SaleFactModel, dimensions: [:item], aggregate: :sum)
    report = ActiveReporting::Report.new(metric)
    data   = report.run

    refute_empty data
    assert(data.all? { |r| r.key?('a_metric') })
  end

  def test_report_runs_with_a_date_grouping
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: UserFactModel,
                                                    dimensions: [{ created_at: { datetime_drill: :month } }])
    report = ActiveReporting::Report.new(metric)
    data = report.run

    assert(data.all? { |r| r.key?('created_at_month') })
    assert_equal 5, data.size
  end

  def test_removed_datetime_drill_shorthand_raises_with_the_replacement_syntax
    error = assert_raises ActiveReporting::InvalidDimensionLabel do
      ActiveReporting::Metric.new(:a_metric, fact_model: UserFactModel, dimensions: [{ created_at: :month }])
    end
    assert_includes error.message, '`{ created_at: { datetime_drill: :month } }`'
  end

  def test_datetime_drills_truncate_like_date_trunc
    created_ats = User.pluck(:created_at).map(&:utc)
    ActiveReporting::ReportingDimension::DATETIME_HIERARCHIES.each do |drill|
      metric = ActiveReporting::Metric.new(:a_metric, fact_model: UserFactModel,
                                                      dimensions: [{ created_at: { datetime_drill: drill } }])
      data = ActiveReporting::Report.new(metric).run

      expected = created_ats.map { |t| date_trunc(drill, t) }.uniq.sort
      actual = data.map { |r| cast_time(r["created_at_#{drill}"]) }.sort

      assert_equal expected, actual, "datetime_drill: #{drill}"
    end
  end

  def test_report_runs_with_a_date_datetime_drill
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: UserFactModel,
                                                    dimensions: [{ created_at: { datetime_drill: :date } }])
    data = ActiveReporting::Report.new(metric).run

    expected = User.pluck(:created_at).map { |t| t.to_date.to_s }.sort

    assert_equal expected, data.map { |r| r['created_at_date'].to_s }.sort
  end

  def test_accept_dimension_join_method_option
    dimensions = [{ platform: { join_method: :left_outer_joins } }]
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: GameFactModel, dimensions: dimensions, aggregate: :sum)
    report = ActiveReporting::Report.new(metric)

    assert_includes report.send(:statement).to_sql, 'LEFT OUTER JOIN'
  end

  def test_report_uses_the_metrics_measure_when_given
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: SaleFactModel, measure: :taxes, aggregate: :sum)
    report = ActiveReporting::Report.new(metric)

    assert_includes report.send(:statement).to_sql, 'taxes)'

    data = report.run

    refute_empty data
    assert_equal Sale.sum(:taxes).to_i, data[0]['a_metric'].to_i
  end

  private

  def with_ransack_dimension_filter
    FigureFactModel.dimension_filter :kind_cont, :ransack
    yield
  ensure
    FigureFactModel.dimension_filters.delete(:kind_cont)
  end

  def with_dimension_label_callback(fact_model, column, callback)
    original = fact_model.dimension_label_callbacks.dup
    fact_model.dimension_label_callback(column, callback)
    yield
  ensure
    fact_model.instance_variable_set(:@dimension_label_callbacks, original)
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
