require 'test_helper'

class ActiveReporting::ConfigurationTest < Minitest::Test
  def setup
    @default_dimension_label = ActiveReporting::Configuration.default_dimension_label
    @new_value = :new_value
  end

  def teardown
    ActiveReporting::Configuration.default_dimension_label = @default_dimension_label
  end

  def test_configurations_can_be_set_in_a_block
    ActiveReporting::Configuration.config do |c|
      c.default_dimension_label = @new_value
    end
    assert_equal @new_value, ActiveReporting::Configuration.default_dimension_label
  end

  def test_default_dimension_label_is_defaulted_and_is_settable
    refute ActiveReporting::Configuration.default_dimension_label.nil?
    ActiveReporting::Configuration.default_dimension_label = @new_value
    assert_equal @new_value, ActiveReporting::Configuration.default_dimension_label
  end

  def test_default_measure_is_defaulted_and_is_settable
    refute ActiveReporting::Configuration.default_measure.nil?
    ActiveReporting::Configuration.default_measure = @new_value
    assert_equal @new_value, ActiveReporting::Configuration.default_measure
  end
end
