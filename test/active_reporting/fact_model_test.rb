require 'test_helper'

class ActiveReporting::FactModelTest < Minitest::Test
  def test_fact_model_may_be_set_by_class_name
    fact_model = FigureFactModel
    fact_model.instance_variable_set('@model', nil)
    assert_equal Figure, fact_model.model
  end

  def test_fact_model_may_be_an_active_record_class
    FigureFactModel.use_model Figure
    assert_equal Figure, FigureFactModel.model
  end

  def test_fact_model_may_be_a_string
    FigureFactModel.use_model 'figure'
    assert_equal Figure, FigureFactModel.model
  end

  def test_fact_model_may_be_a_symbol
    FigureFactModel.use_model :figure
    assert_equal Figure, FigureFactModel.model
  end

  def test_fact_model_has_a_measure_is_settable
    original = FigureFactModel.measure
    refute FigureFactModel.nil?
    new_value = :new_value
    FigureFactModel.measure = new_value
    assert_equal new_value, FigureFactModel.measure
  ensure
    FigureFactModel.measure = original
  end

  def test_fact_model_has_dimensions
    assert FigureFactModel.dimensions.is_a?(Hash)
    assert FigureFactModel.dimensions.values.all?{|d| d.is_a?(ActiveReporting::Dimension)}
  end

  def test_fact_model_has_dimension_label_callbacks
    original = FigureFactModel.dimension_label_callbacks.dup

    assert FigureFactModel.dimension_label_callbacks.is_a?(Hash)
    column = :foo
    callback = ->() {}
    FigureFactModel.dimension_label_callback column, callback
    assert_equal callback, FigureFactModel.dimension_label_callbacks[column]
  ensure
    FigureFactModel.instance_variable_set('@dimension_label_callbacks', original)
  end

  def test_dimension_label_callback_much_be_a_callable_object
    assert_raises ArgumentError do
      FigureFactModel.dimension_label_callback :foo, 'bar'
    end
  end

  def test_fact_model_can_lookup_own_dimension_filter
    assert FigureFactModel.find_dimension_filter(:kind_is).present?
    assert FigureFactModel.find_dimension_filter('kind_is').present?
  end

  def test_fact_model_raises_if_dimension_filter_is_not_found
    assert_raises ActiveReporting::UnknownDimensionFilter do
      FigureFactModel.find_dimension_filter(:nonexistant_filter)
    end
  end
end
