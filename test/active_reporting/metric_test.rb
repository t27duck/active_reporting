require 'test_helper'

class ActiveReporting::MetricTest < Minitest::Test
  def setup
    @metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:kind])
  end

  def test_metric_makes_fact_model_avalable
    assert_equal FigureFactModel, @metric.fact_model
  end

  def test_metric_makes_model_avalable
    assert_equal Figure, @metric.model
  end

  def test_metric_makes_dimensions_available
    assert @metric.dimensions.is_a?(Array)
    assert @metric.dimensions.all?{ |d| d.is_a?(ActiveReporting::ReportingDimension) }
  end

  def test_metric_raises_if_given_an_unknown_dimension
    assert_raises ActiveReporting::UnknownDimension do
      ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:invalid])
    end
  end

  def test_metric_has_dimension_filter
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimension_filter: {kind_is: 'foo'})
    assert metric.dimension_filter.is_a?(Hash)
  end

  def test_metric_raises_on_an_invalid_aggregate
    assert_raises ActiveReporting::UnknownAggregate do
      ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, aggregate: :not_valid)
    end
  end

  def test_report_builds_a_report_object
    result = @metric.report
    assert result.is_a?(ActiveReporting::Report)
  end

  def test_metric_can_have_an_order_by_dimension
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:kind], order_by_dimension: {kind: :asc})
    assert metric.order_by_dimension.is_a?(Hash)
    assert_equal({:kind => :asc}, metric.order_by_dimension)
  end

  def test_metric_can_define_a_measure
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: SaleFactModel, measure: :taxes)
    assert_equal :taxes, metric.measure
  end

  def test_metric_does_not_define_a_measure_by_default
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: SaleFactModel)
    assert_nil metric.measure
  end
end
