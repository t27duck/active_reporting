require 'test_helper'

class ActiveReporting::ReportTest < Minitest::Test
  def setup
    @metric = ActiveReporting::Metric.new(:a_metric, fact_model: PostFactModel, dimensions: [:state])
  end

  def test_run_returns_an_array
    report = ActiveReporting::Report.new(@metric)
    assert report.run.is_a?(Array)
  end
end
