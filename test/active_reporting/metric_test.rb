require 'test_helper'

class ActiveReporting::MetricTest < Minitest::Test
  def setup
    @metric = ActiveReporting::Metric.new(:a_metric, fact_model: PostFactModel, dimensions: [:state])
  end

  def test_metric_makes_fact_model_avalable
    assert_equal PostFactModel, @metric.fact_model
  end

  def test_metric_makes_model_avalable
    assert_equal Post, @metric.model
  end

  def test_metric_makes_dimensions_available
    assert @metric.dimensions.is_a?(Array)
    assert @metric.dimensions.all?{ |d| d.is_a?(ActiveReporting::ReportingDimension) }
  end

  def test_metric_raises_if_given_an_unknown_dimension
    assert_raises ActiveReporting::UnknownDimension do
      ActiveReporting::Metric.new(:a_metric, fact_model: PostFactModel, dimensions: [:invalid])
    end
  end

  def test_metric_has_dimension_filter
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: PostFactModel, dimension_filter: {some_filter: 1})
    assert metric.dimension_filter.is_a?(Hash)
  end
end
