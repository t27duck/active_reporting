require 'test_helper'

class ActiveReporting::ActiveRecordAdaptorTest < ActiveSupport::TestCase
  def test_fact_model_returns_fact_model_class
    assert_equal SeriesFactModel, Series.fact_model
  end

  def test_fact_model_is_created_if_not_defined
    Object.send(:remove_const, :ProfileFactModel) if defined?(ProfileFactModel)
    assert Profile.fact_model < ActiveReporting::FactModel, '.model is not a FactModel class'
  end
end
