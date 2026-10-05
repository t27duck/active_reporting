require 'test_helper'

class ActiveReporting::DimensionTest < ActiveSupport::TestCase
  def test_dimension_can_have_a_type
    subject = ActiveReporting::Dimension.new(FigureFactModel, name: :series)
    assert_equal :standard, subject.type

    subject = ActiveReporting::Dimension.new(FigureFactModel, name: :kind)
    assert_equal ActiveReporting::Dimension::TYPES[:degenerate], subject.type

    subject = ActiveReporting::Dimension.new(ReleaseDateFactModel, name: :released_on)
    assert_equal :standard, subject.type

    assert_raises ActiveReporting::UnknownDimension do
      ActiveReporting::Dimension.new(FigureFactModel, name: :not_a_dimension).type
    end
  end

  def test_dimension_can_be_hierarchical
    subject = ActiveReporting::Dimension.new(FigureFactModel, name: :series)
    refute subject.hierarchical?

    subject = ActiveReporting::Dimension.new(FigureFactModel, name: :kind)
    refute subject.hierarchical?

    subject = ActiveReporting::Dimension.new(ReleaseDateFactModel, name: :released_on)
    assert subject.hierarchical?
  end

  def test_hierarchical_is_memoized_when_false
    dimension = ActiveReporting::Dimension.new(FigureFactModel, name: :series)
    assert_memoized(dimension, :hierarchical?, :klass) { |result| assert_equal false, result }
  end

  def test_association_is_memoized_when_nil
    dimension = ActiveReporting::Dimension.new(FigureFactModel, name: :kind)
    assert_memoized(dimension, :association, :model) { |result| assert_nil result }
  end

  private

  # Calls `method` twice and asserts `dependency` (the method it computes its
  # result from) was only invoked the first time
  def assert_memoized(dimension, method, dependency)
    calls = 0
    original = dimension.method(dependency)
    dimension.define_singleton_method(dependency) do
      calls += 1
      original.call
    end

    2.times { yield dimension.public_send(method) }
    assert_equal 1, calls, "#{method} was not memoized"
  end
end
