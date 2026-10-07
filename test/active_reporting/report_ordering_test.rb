# frozen_string_literal: true

require 'test_helper'

class ActiveReporting::ReportOrderingTest < Minitest::Test
  def test_report_orders_by_a_dimension
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:kind],
                                                    order_by_dimension: { kind: :desc })

    assert_equal(['amiibo figure', 'amiibo card'], ActiveReporting::Report.new(metric).run.map { |r| r['kind'] })
  end

  def test_report_may_order_by_a_dimension_the_report_adds
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, order_by_dimension: { kind: :desc })
    data = ActiveReporting::Report.new(metric, dimensions: [:kind]).run

    assert_equal(['amiibo figure', 'amiibo card'], data.map { |r| r['kind'] })
  end

  def test_report_raises_when_ordering_by_a_dimension_not_in_the_report
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:kind],
                                                    order_by_dimension: { series: :asc })

    error = assert_raises ActiveReporting::UnknownDimension do
      ActiveReporting::Report.new(metric)
    end
    assert_includes error.message, "'series'"
  end
end
