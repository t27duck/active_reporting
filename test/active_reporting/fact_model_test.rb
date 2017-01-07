require 'test_helper'

class ActiveReporting::FactModelTest < Minitest::Test
  def test_model_may_be_set_by_class_name
    fact_model = PostFactModel
    fact_model.instance_variable_set('@model', nil)
    assert_equal Post, fact_model.model
  end

  def test_model_may_be_an_active_record_class
    PostFactModel.use_model Post
    assert_equal Post, PostFactModel.model
  end

  def test_model_may_be_a_string
    PostFactModel.use_model 'post'
    assert_equal Post, PostFactModel.model
  end

  def test_model_may_be_a_symbol
    PostFactModel.use_model :post
    assert_equal Post, PostFactModel.model
  end
end
