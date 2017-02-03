require 'test_helper'

class ActiveReportingTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ActiveReporting::VERSION
  end

  def test_metrics_can_be_registered
    ActiveReporting.register_metric(:a_metric, fact_model: PostFactModel)
    assert ActiveReporting.instance_variable_get('@metrics')[:a_metric].is_a? ActiveReporting::Metric
  end

  def test_metrics_can_be_fetched
    ActiveReporting.register_metric(:a_metric, fact_model: PostFactModel)
    assert ActiveReporting.fetch_metric(:a_metric).is_a? ActiveReporting::Metric
    assert ActiveReporting.fetch_metric('a_metric').is_a? ActiveReporting::Metric
  end
end
