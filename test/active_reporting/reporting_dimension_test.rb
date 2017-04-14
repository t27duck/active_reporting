require 'test_helper'

class ActiveReporting::ReportingDimensionTest < ActiveSupport::TestCase
  def setup
    @default_label                                = ActiveReporting::Configuration.default_dimension_label

    @figure_kind_dimension                        = ActiveReporting::Dimension.new(FigureFactModel, name: :kind)
    @figure_series_dimension                      = ActiveReporting::Dimension.new(FigureFactModel, name: :series)
    @series_fact_model_default_label              = SeriesFactModel.dimension_label

    @release_date_released_on_dimension           = ActiveReporting::Dimension.new(ReleaseDateFactModel, name: :released_on)

    @game_compatability_platform_dimension        = ActiveReporting::Dimension.new(GameCompatabilityFactModel, name: :platform)
    @game_compatability_fact_model_default_label  = GameCompatabilityFactModel.dimension_label

    @user_profile_dimension                       = ActiveReporting::Dimension.new(UserFactModel, name: :profile)
    @user_fact_model_default_label                = UserFactModel.dimension_label
  end

  def test_forign_key_is_name_if_degenerate
    subject = ActiveReporting::ReportingDimension.new(@figure_kind_dimension)
    assert_equal 'kind', subject.foreign_key
  end

  def test_forign_key_for_belongs_to_relation_if_standard
    subject = ActiveReporting::ReportingDimension.new(@figure_series_dimension)
    assert_equal 'series_id', subject.foreign_key
  end

  def test_forign_key_for_has_one_relation_if_standard
    subject = ActiveReporting::ReportingDimension.new(@user_profile_dimension)
    assert_equal 'user_id', subject.foreign_key
  end

  def test_select_statement_is_just_column_if_degenerate
    subject = ActiveReporting::ReportingDimension.new(@figure_kind_dimension)
    assert_equal ["#{Figure.quoted_table_name}.kind"], subject.select_statement
  end

  def test_select_statement_can_include_identifier_if_standard
    subject = ActiveReporting::ReportingDimension.new(@figure_series_dimension)
    expected = ["#{Series.quoted_table_name}.#{@series_fact_model_default_label} AS series", "#{Series.quoted_table_name}.#{Series.primary_key} AS series_identifier"]
    assert_equal expected, subject.select_statement

    expected = ["#{Series.quoted_table_name}.#{@series_fact_model_default_label} AS series"]
    assert_equal expected, subject.select_statement(with_identifier: false)
  end

  def test_group_by_statement_is_just_column_if_degenerate
    subject = ActiveReporting::ReportingDimension.new(@figure_kind_dimension)
    assert_equal ["#{Figure.quoted_table_name}.kind"], subject.group_by_statement
  end

  def test_group_by_statement_can_include_identifier_if_standard
    subject = ActiveReporting::ReportingDimension.new(@figure_series_dimension)
    expected = ["#{Series.quoted_table_name}.#{@series_fact_model_default_label}", "#{Series.quoted_table_name}.#{Series.primary_key}"]
    assert_equal expected, subject.group_by_statement

    expected = ["#{Series.quoted_table_name}.#{@series_fact_model_default_label}"]
    assert_equal expected, subject.group_by_statement(with_identifier: false)
  end

  def test_gorup_by_statement_includes_label
    subject = ActiveReporting::ReportingDimension.new(@release_date_released_on_dimension, label: :month)
    assert_includes subject.group_by_statement, "#{DateDimension.quoted_table_name}.month"
  end

  def test_label_may_be_passed_for_hierarchical_dimension
    subject = ActiveReporting::ReportingDimension.new(@release_date_released_on_dimension, label: :year)
    assert_equal :year, subject.instance_variable_get(:@label)
  end

  def test_label_must_be_of_the_fact_models_hierarchical_dimension_labels
    assert_raises ActiveReporting::InvalidDimensionLabel do
      ActiveReporting::ReportingDimension.new(@release_date_released_on_dimension, label: :not_a_label)
    end
  end

  def test_label_can_only_be_passed_in_if_dimension_is_herarchical
    refute @figure_series_dimension.type == :herarchical
    assert_raises ActiveReporting::InvalidDimensionLabel do
      ActiveReporting::ReportingDimension.new(@figure_series_dimension, label: :foo)
    end
  end

  def test_order_by_statement_is_dimensions_column_sql_snippet
    subject = ActiveReporting::ReportingDimension.new(@figure_kind_dimension)
    assert_equal "#{Figure.quoted_table_name}.kind ASC", subject.order_by_statement(direction: :asc)

    subject = ActiveReporting::ReportingDimension.new(@figure_series_dimension)
    assert_equal "#{Series.quoted_table_name}.#{@series_fact_model_default_label} DESC", subject.order_by_statement(direction: :desc)
  end

  def test_order_by_statement_must_have_a_valid_direction
    subject = ActiveReporting::ReportingDimension.new(@figure_kind_dimension)
    assert_raises RuntimeError do
      subject.order_by_statement(direction: :invalid)
    end
  end
end
