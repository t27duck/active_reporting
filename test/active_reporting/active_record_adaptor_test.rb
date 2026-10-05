require 'test_helper'

module Reporting
  class Sale < ActiveRecord::Base
    self.table_name = 'sales'
  end

  class User < ActiveRecord::Base
    self.table_name = 'users'
  end

  class UserFactModel < ActiveReporting::FactModel
    self.model = 'Reporting::User'
  end
end

class BrokenFactModelProfile < ActiveRecord::Base
  self.table_name = 'profiles'
end

class ActiveReporting::ActiveRecordAdaptorTest < ActiveSupport::TestCase
  def test_fact_model_returns_fact_model_class
    assert_equal SeriesFactModel, Series.fact_model
  end

  def test_fact_model_is_created_if_not_defined
    Object.send(:remove_const, :ProfileFactModel) if defined?(ProfileFactModel)
    assert Profile.fact_model < ActiveReporting::FactModel, '.model is not a FactModel class'
  end

  def test_fact_model_is_created_in_the_namespace_of_a_namespaced_model
    fact_model = Reporting::Sale.fact_model

    assert_equal 'Reporting::SaleFactModel', fact_model.name
    assert_equal Reporting::Sale, fact_model.model
    refute_equal SaleFactModel, fact_model
  end

  def test_fact_model_finds_a_defined_namespaced_fact_model
    assert_equal Reporting::UserFactModel, Reporting::User.fact_model
  end

  # Simulates a defined fact model whose body raises a NameError (e.g. a typo) when autoloaded
  def test_fact_model_does_not_swallow_name_errors_raised_by_a_defined_fact_model
    Object.singleton_class.define_method(:const_missing) do |const_name|
      raise NameError.new('uninitialized constant SomeTypo', :SomeTypo) if const_name == :BrokenFactModelProfileFactModel

      super(const_name)
    end

    assert_raises(NameError) { BrokenFactModelProfile.fact_model }
    refute Object.const_defined?(:BrokenFactModelProfileFactModel, false)
  ensure
    Object.singleton_class.remove_method(:const_missing)
  end
end
