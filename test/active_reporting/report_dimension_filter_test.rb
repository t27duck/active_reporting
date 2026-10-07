# frozen_string_literal: true

require 'test_helper'

class ActiveReporting::ReportDimensionFilterTest < Minitest::Test
  ALL_KINDS = ['amiibo card', 'amiibo figure'].freeze

  def setup
    @metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:kind])
  end

  def test_scope_without_an_argument_is_applied_by_true
    [true, 'true'].each do |value|
      assert_equal ['amiibo card'], kinds(cards: value), value.inspect
    end
  end

  def test_scope_without_an_argument_is_left_out_by_false
    [false, 'false'].each do |value|
      assert_equal ALL_KINDS, kinds(cards: value), value.inspect
    end
  end

  def test_scope_is_passed_any_other_value
    assert_equal ['amiibo figure'], kinds(of_kind: 'amiibo figure')
  end

  def test_lambda_without_parameters_is_applied_by_true
    [true, 'true'].each do |value|
      assert_equal ['amiibo card'], kinds(only_cards: value), value.inspect
    end
  end

  def test_lambda_without_parameters_is_left_out_by_false
    [false, 'false'].each do |value|
      assert_equal ALL_KINDS, kinds(only_cards: value), value.inspect
    end
  end

  def test_lambda_with_a_parameter_is_passed_true_and_false
    assert_equal ['amiibo card'], kinds(card: true)
    assert_equal ['amiibo figure'], kinds(card: false)
  end

  def test_lambda_with_a_parameter_is_passed_any_other_value
    assert_equal ['amiibo figure'], kinds(kind_is: 'amiibo figure')
  end

  def test_metric_ransack_fallback_filter_cannot_be_overridden_by_the_report
    FigureFactModel.use_ransack_for_unknown_dimension_filters
    metric = ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel, dimensions: [:kind],
                                                    dimension_filter: { kind_cont: 'card' })
    data = ActiveReporting::Report.new(metric, dimension_filter: { 'kind_cont' => 'figure' }).run

    assert_equal(['amiibo card'], data.map { |r| r['kind'] })
  ensure
    FigureFactModel.instance_variable_set(:@ransack_fallback, false)
  end

  private

  def kinds(dimension_filter)
    ActiveReporting::Report.new(@metric, dimension_filter: dimension_filter).run.map { |r| r['kind'] }.sort
  end
end
