require 'test_helper'

class ActiveReporting::ReportingDimensionTest < ActiveSupport::TestCase
  def setup
    @default_label                  = ActiveReporting::Configuration.default_dimension_label
    @post_state_dimension           = ActiveReporting::Dimension.new(PostFactModel, name: :state)
    @post_creator_dimension         = ActiveReporting::Dimension.new(PostFactModel, name: :creator)
    @post_created_on_dimension      = ActiveReporting::Dimension.new(PostFactModel, name: :created_on)
    @user_profile_dimension         = ActiveReporting::Dimension.new(UserFactModel, name: :profile)
    @user_fact_model_default_label  = UserFactModel.dimension_label
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

  def test_gorup_by_statement_includes_label_and_hierarchical_label
    subject = ActiveReporting::ReportingDimension.new(@post_created_on_dimension, label: :month)
    assert_includes subject.group_by_statement, "\"date_dimensions\".month_str"
    assert_includes subject.group_by_statement, "\"date_dimensions\".month"
  end

  def test_label_may_be_passed_for_hierarchical_dimension
    subject = ActiveReporting::ReportingDimension.new(@post_created_on_dimension, label: :year)
    assert_equal :year, subject.instance_variable_get(:@label)
  end

  def test_label_may_be_passed_for_hierarchical_dimension_and_uses_hierarchical_label
    subject = ActiveReporting::ReportingDimension.new(@post_created_on_dimension, label: :month)
    assert_equal :month_str, subject.instance_variable_get(:@label)
  end

  def test_label_must_be_of_the_fact_models_hierarchical_dimension_labels
    assert_raises ActiveReporting::InvalidDimensionLabel do
      ActiveReporting::ReportingDimension.new(@post_created_on_dimension, label: :not_a_label)
    end
  end

  def test_label_can_only_be_passed_in_if_dimension_is_herarchical
    refute @post_creator_dimension.type == :herarchical
    assert_raises ActiveReporting::InvalidDimensionLabel do
      ActiveReporting::ReportingDimension.new(@post_creator_dimension, label: :foo)
    end
  end

  def test_order_by_statement_is_dimensions_column_sql_snippet
    subject = ActiveReporting::ReportingDimension.new(@post_state_dimension)
    assert_equal '"posts".state ASC', subject.order_by_statement(direction: :asc)

    subject = ActiveReporting::ReportingDimension.new(@post_creator_dimension)
    assert_equal "\"users\".#{@user_fact_model_default_label} DESC", subject.order_by_statement(direction: :desc)
  end

  def test_order_by_statement_must_have_a_valid_direction
    subject = ActiveReporting::ReportingDimension.new(@post_state_dimension)
    assert_raises RuntimeError do
      subject.order_by_statement(direction: :invalid)
    end
  end
end
