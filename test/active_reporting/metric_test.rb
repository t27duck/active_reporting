require 'test_helper'

class ActiveReporting::MetricTest < Minitest::Test
  def test_metric_makes_fact_model_and_dimensions_avalable
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: PostFactModel, dimensions: [:state])
    assert_equal PostFactModel, metric.fact_model
    assert_equal [metric.fact_model.dimensions[:state]], metric.dimensions
  end

  def test_metric_raises_if_given_an_unknown_dimension
    assert_raises ActiveReporting::UnknownDimension do
      ActiveReporting::Metric.new(:a_metric, fact_model: PostFactModel, dimensions: [:invalid])
    end
  end
end
