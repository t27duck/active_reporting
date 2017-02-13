require 'test_helper'

class ActiveReportingTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ActiveReporting::VERSION
  end

  def test_metrics_can_be_fetched
    assert ActiveReporting.fetch_metric(:a_metric).is_a? ActiveReporting::Metric
    assert ActiveReporting.fetch_metric('a_metric').is_a? ActiveReporting::Metric
  end
end
