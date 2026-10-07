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

  def test_metric_filter_accepts_string_operators
    symbol_data = ActiveReporting::Report.new(@metric, metric_filter: { gt: 1 }).run
    string_data = ActiveReporting::Report.new(@metric, metric_filter: { 'gt' => 1 }).run

    refute_empty string_data
    assert_equal symbol_data, string_data
  end

  def test_report_metric_filter_overrides_metric_filter_with_the_same_operator_as_a_string
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:kind],
                                                    metric_filter: { gt: 1_000_000 })
    data = ActiveReporting::Report.new(metric, metric_filter: { 'gt' => 0 }).run

    refute_empty data
  end

  def test_report_raises_on_an_unknown_metric_filter_operator
    error = assert_raises ActiveReporting::UnknownMetricFilterOperator do
      ActiveReporting::Report.new(@metric, metric_filter: { greater: 1 })
    end
    assert_includes error.message, 'greater'
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

    assert_includes report.send(:statement).to_sql,
                    "SUM(#{Sale.quoted_table_name}.#{Sale.connection.quote_column_name('taxes')})"

    data = report.run

    refute_empty data
    assert_equal Sale.sum(:taxes).to_i, data[0]['a_metric'].to_i
  end

  def test_measure_is_qualified_with_the_fact_model_table
    # date_dimensions also has an id column, so an unqualified MAX(id) would be ambiguous
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: SaleFactModel, dimensions: [:placed_at],
                                                    measure: :id, aggregate: :max)
    data = ActiveReporting::Report.new(metric).run

    refute_empty data
    expected = Sale.group(:placed_at_id).maximum(:id)

    data.each do |row|
      assert_equal expected[row['placed_at_identifier'].to_i], row['a_metric'].to_i
    end
  end

  def test_measure_is_quoted
    measure = 'taxes) FROM sales; --'
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: SaleFactModel, measure: measure, aggregate: :sum)

    assert_includes ActiveReporting::Report.new(metric).send(:statement).to_sql,
                    "SUM(#{Sale.quoted_table_name}.#{Sale.connection.quote_column_name(measure)})"
  end

  def test_measure_may_be_a_sql_expression
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: SaleFactModel,
                                                    measure: Arel.sql('base_price + taxes'), aggregate: :sum)
    data = ActiveReporting::Report.new(metric).run

    assert_equal (Sale.sum(:base_price) + Sale.sum(:taxes)).to_i, data[0]['a_metric'].to_i
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
end
