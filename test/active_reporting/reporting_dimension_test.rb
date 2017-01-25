require 'test_helper'

class ActiveReporting::ReportingDimensionTest < ActiveSupport::TestCase
  def setup
    @default_label = ActiveReporting::Configuration.default_dimension_label
    @post_state_dimension   = ActiveReporting::Dimension.new(PostFactModel, name: :state)
    @post_creator_dimension = ActiveReporting::Dimension.new(PostFactModel, name: :creator)
    @user_profile_dimension = ActiveReporting::Dimension.new(UserFactModel, name: :profile)
    @user_fact_model_default_label = UserFactModel.dimension_label
  end

  def test_forign_key_is_name_if_degenerate
    subject = ActiveReporting::ReportingDimension.new(@post_state_dimension)
    assert_equal 'state', subject.foreign_key
  end

  def test_forign_key_for_belongs_to_relation_if_standard
    subject = ActiveReporting::ReportingDimension.new(@post_creator_dimension)
    assert_equal 'creator_id', subject.foreign_key
  end

  def test_forign_key_for_has_one_relation_if_standard
    subject = ActiveReporting::ReportingDimension.new(@user_profile_dimension)
    assert_equal 'user_id', subject.foreign_key
  end

  def test_select_statement_is_just_column_if_degenerate
    subject = ActiveReporting::ReportingDimension.new(@post_state_dimension)
    assert_equal ['"posts".state'], subject.select_statement
  end

  def test_select_statement_can_include_identifier_if_standard
    subject = ActiveReporting::ReportingDimension.new(@post_creator_dimension)
    expected = ["\"users\".#{@user_fact_model_default_label} AS creator", '"users".id AS creator_identifier']
    assert_equal expected, subject.select_statement

    expected = ["\"users\".#{@user_fact_model_default_label} AS creator"]
    assert_equal expected, subject.select_statement(with_identifier: false)
  end

  def test_group_by_statement_is_just_column_if_degenerate
    subject = ActiveReporting::ReportingDimension.new(@post_state_dimension)
    assert_equal ['"posts".state'], subject.group_by_statement
  end

  def test_group_by_statement_can_include_identifier_if_standard
    subject = ActiveReporting::ReportingDimension.new(@post_creator_dimension)
    expected = ["\"users\".#{@user_fact_model_default_label}", '"users".id']
    assert_equal expected, subject.group_by_statement

    expected = ["\"users\".#{@user_fact_model_default_label}"]
    assert_equal expected, subject.group_by_statement(with_identifier: false)
  end
end
