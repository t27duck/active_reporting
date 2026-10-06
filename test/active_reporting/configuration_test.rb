# frozen_string_literal: true

require 'test_helper'

class ActiveReporting::ConfigurationTest < Minitest::Test
  def setup
    @default_dimension_label = ActiveReporting::Configuration.default_dimension_label
    @new_value = :new_value
    @metric_lookup_class = ActiveReporting::Configuration.metric_lookup_class
  end

  def teardown
    ActiveReporting::Configuration.default_dimension_label = @default_dimension_label
    ActiveReporting::Configuration.metric_lookup_class = @metric_lookup_class
  end

  def test_configurations_can_be_set_in_a_block
    ActiveReporting::Configuration.config do |c|
      c.default_dimension_label = @new_value
    end

    assert_equal @new_value, ActiveReporting::Configuration.default_dimension_label
  end

  def test_default_dimension_label_is_defaulted_and_is_settable
    refute_nil ActiveReporting::Configuration.default_dimension_label
    ActiveReporting::Configuration.default_dimension_label = @new_value

    assert_equal @new_value, ActiveReporting::Configuration.default_dimension_label
  end

  def test_default_measure_is_defaulted_and_is_settable
    refute_nil ActiveReporting::Configuration.default_measure
    ActiveReporting::Configuration.default_measure = @new_value

    assert_equal @new_value, ActiveReporting::Configuration.default_measure
  end

  def test_metric_lookup_class_does_not_singularize_the_name
    ActiveReporting::Configuration.metric_lookup_class = 'StoredMetrics'

    assert_equal '::StoredMetrics', ActiveReporting::Configuration.metric_lookup_class
  end

  def test_metric_lookup_class_accepts_a_class
    ActiveReporting::Configuration.metric_lookup_class = Metric

    assert_equal '::Metric', ActiveReporting::Configuration.metric_lookup_class
  end

  def test_metric_lookup_class_accepts_snake_case_and_namespaced_names
    ActiveReporting::Configuration.metric_lookup_class = :stored_metrics

    assert_equal '::StoredMetrics', ActiveReporting::Configuration.metric_lookup_class

    ActiveReporting::Configuration.metric_lookup_class = 'reports/stored_metrics'

    assert_equal '::Reports::StoredMetrics', ActiveReporting::Configuration.metric_lookup_class

    ActiveReporting::Configuration.metric_lookup_class = '::Reports::StoredMetrics'

    assert_equal '::Reports::StoredMetrics', ActiveReporting::Configuration.metric_lookup_class
  end

  def test_ransack_fallback_can_be_disabled_without_ransack
    original = ActiveReporting::Configuration.ransack_available
    ActiveReporting::Configuration.ransack_available = false

    ActiveReporting::Configuration.ransack_fallback = false
    assert_raises(ActiveReporting::RansackNotAvailable) { ActiveReporting::Configuration.ransack_fallback = true }
  ensure
    ActiveReporting::Configuration.ransack_available = original
  end
end
