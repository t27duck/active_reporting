# frozen_string_literal: true

module ActiveReporting
  # This is included into every class that inherits from ActiveRecord::Base
  module ActiveRecordAdaptor
    # Returns the ActiveReporting::FactModel related to the model.
    #
    # If a [MyModel]FactModel class is not defined, a fact model is generated for the model.
    #
    # @return [ActiveReporting::FactModel]
    def fact_model
      FactModelRegistry.fetch(self)
    end
  end
end
