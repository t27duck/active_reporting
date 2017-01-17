require 'test_helper'

class ActiveReporting::ActiveRecordAdaptorTest < ActiveSupport::TestCase
  def test_fact_model_returns_fact_model_class
    assert_equal PostFactModel, Post.fact_model
  end

  def test_fact_model_is_created_if_not_defined
    refute defined?(StoryFactModel)
    assert Story.fact_model < ActiveReporting::FactModel, '.model is not a FactModel class'
  end
end
