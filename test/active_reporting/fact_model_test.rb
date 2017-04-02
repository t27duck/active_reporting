require 'test_helper'

class ActiveReporting::FactModelTest < Minitest::Test
  def test_fact_model_may_be_set_by_class_name
    fact_model = PostFactModel
    fact_model.instance_variable_set('@model', nil)
    assert_equal Post, fact_model.model
  end

  def test_fact_model_may_be_an_active_record_class
    PostFactModel.use_model Post
    assert_equal Post, PostFactModel.model
  end

  def test_fact_model_may_be_a_string
    PostFactModel.use_model 'post'
    assert_equal Post, PostFactModel.model
  end

  def test_fact_model_may_be_a_symbol
    PostFactModel.use_model :post
    assert_equal Post, PostFactModel.model
  end

  def test_fact_model_has_a_measure_is_settable
    original = PostFactModel.measure
    refute PostFactModel.nil?
    new_value = :new_value
    PostFactModel.measure = new_value
    assert_equal new_value, PostFactModel.measure
  ensure
    PostFactModel.measure = original
  end

  def test_fact_model_has_dimensions
    assert PostFactModel.dimensions.is_a?(Hash)
    assert PostFactModel.dimensions.values.all?{|d| d.is_a?(ActiveReporting::Dimension)}
  end

  def test_fact_model_can_lookup_own_dimension_filter
    assert PostFactModel.find_dimension_filter(:some_filter).present?
  end

  def test_fact_model_raises_if_dimension_filter_is_not_found
    assert_raises ActiveReporting::UnknownDimensionFilter do
      PostFactModel.find_dimension_filter(:nonexistant_filter)
    end
  end

  def test_fact_model_has_hierarchy_labels
    assert PostFactModel.hierarchy_labels.is_a?(Hash)
  end

  def test_fact_mode_can_set_hierarchy_label
    PostFactModel.hierarchy_label(:foo, :bar)
    assert PostFactModel.hierarchy_labels.key?(:foo)
    assert_equal :bar, PostFactModel.hierarchy_labels[:foo]
  end
end
