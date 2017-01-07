require 'test_helper'

class ActiveReporting::DimensionTest < ActiveSupport::TestCase
  def test_dimension_can_have_a_type
    subject = ActiveReporting::Dimension.new(Post, name: :creator)
    assert_equal :standard, subject.type

    subject = ActiveReporting::Dimension.new(Post, name: :state)
    assert_equal :degenerate, subject.type

    assert_raises ActiveReporting::UnknownDimension do
      ActiveReporting::Dimension.new(Post, name: :not_a_dimension).type
    end
  end

  def test_forign_key_is_name_if_degenerate
    subject = ActiveReporting::Dimension.new(Post, name: :state)
    assert_equal 'state', subject.foreign_key
  end

  def test_forign_key_for_belongs_to_relation_if_standard
    subject = ActiveReporting::Dimension.new(Post, name: :creator)
    assert_equal 'creator_id', subject.foreign_key
  end

  def test_forign_key_for_has_one_relation_if_standard
    subject = ActiveReporting::Dimension.new(User, name: :profile)
    assert_equal 'user_id', subject.foreign_key
  end

  def test_select_statement_is_just_column_if_degenerate
    subject = ActiveReporting::Dimension.new(Post, name: :state)
    assert_equal ['"posts".state'], subject.select_statement
  end

  def test_select_statement_can_include_identifier_if_standard
    subject = ActiveReporting::Dimension.new(Post, name: :creator)
    expected = ['"users".value AS creator', '"users".id AS creator_identifier']
    assert_equal expected, subject.select_statement

    expected = ['"users".value AS creator']
    assert_equal expected, subject.select_statement(with_identifier: false)
  end

  def test_group_by_statement_is_just_column_if_degenerate
    subject = ActiveReporting::Dimension.new(Post, name: :state)
    assert_equal ['"posts".state'], subject.group_by_statement
  end

  def test_group_by_statement_can_include_identifier_if_standard
    subject = ActiveReporting::Dimension.new(Post, name: :creator)
    expected = ['"users".value', '"users".id']
    assert_equal expected, subject.group_by_statement

    expected = ['"users".value']
    assert_equal expected, subject.group_by_statement(with_identifier: false)
  end

end
