# frozen_string_literal: true

module ActiveReporting
  # This is included into every class that inherits from ActiveRecord::Base
  module ActiveRecordAdaptor
    # Returns the ActiveReporting::FactModel related to the model.
    #
    # If one is not explictily defined, a constant will be created which
    # inherits from ActiveReporting::Factmodel named [MyModel]FactModel
    #
    # @return [ActiveReporting::FactModel]
    def fact_model
      @fact_model ||= "#{name}FactModel".safe_constantize || begin
        const = module_parent.const_set("#{name.demodulize}FactModel", Class.new(ActiveReporting::FactModel))
        const.model = self
        const
      end
    end
  end
end
