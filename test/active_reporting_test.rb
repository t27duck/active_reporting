require 'test_helper'

class ActiveReportingTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ActiveReporting::VERSION
  end

  def test_requiring_the_gem_does_not_load_active_record_base
    script = 'require "active_reporting"; print ActiveRecord.autoload?(:Base).nil?'
    output = IO.popen([RbConfig.ruby, '-Ilib', '-e', script], &:read)
    assert_equal 'false', output, 'ActiveRecord::Base was loaded when requiring active_reporting'
  end

  def test_metrics_can_be_fetched
    assert ActiveReporting.fetch_metric(:a_metric).is_a? ActiveReporting::Metric
    assert ActiveReporting.fetch_metric('a_metric').is_a? ActiveReporting::Metric
  end

  def test_fetch_metric_raises_when_lookup_class_is_not_defined
    with_metric_lookup_class('::NotARealMetricLookup') do
      error = assert_raises(ActiveReporting::BadMetricLookupClass) { ActiveReporting.fetch_metric(:a_metric) }
      assert_match(/::NotARealMetricLookup not defined/, error.message)
    end
  end

  def test_fetch_metric_raises_when_lookup_class_does_not_define_lookup
    with_metric_lookup_class('::Object') do
      error = assert_raises(ActiveReporting::BadMetricLookupClass) { ActiveReporting.fetch_metric(:a_metric) }
      assert_match(/needs to define a class method called 'lookup'/, error.message)
    end
  end

  private

  def with_metric_lookup_class(klass_name)
    original = ActiveReporting::Configuration.metric_lookup_class
    ActiveReporting::Configuration.metric_lookup_class = klass_name
    yield
  ensure
    ActiveReporting::Configuration.instance_variable_set(:@metric_lookup_class, original)
  end
end
