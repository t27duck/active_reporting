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

  def test_dimension_can_have_label_column
    subject = ActiveReporting::Dimension.new(FigureFactModel, name: :series, label_column: :title)
    assert_equal :title, subject.label_column
  end
end
