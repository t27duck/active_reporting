# frozen_string_literal: true

require 'concurrent/map'

module ActiveReporting
  # Maps ActiveRecord models to their fact models.
  #
  # Lookups are cached here instead of on the model classes so the cache can be cleared when Rails
  # reloads code (see ActiveReporting::Railtie). Otherwise a model could keep returning a fact model
  # from before the reload, or a fact model could keep pointing to a model from before the reload.
  module FactModelRegistry
    @fact_models = Concurrent::Map.new

    class << self
      # Returns the fact model for an ActiveRecord model: the `[MyModel]FactModel` class if one is
      # defined, otherwise a generated fact model linked to the model.
      #
      # @param model [Class] an ActiveRecord model
      # @return [Class] an ActiveReporting::FactModel subclass
      def fetch(model)
        @fact_models.fetch_or_store(model) { "#{model.name}FactModel".safe_constantize || generate(model) }
      end

      # Links an ActiveRecord model to a fact model
      #
      # @param model [Class] an ActiveRecord model
      # @param fact_model [Class] an ActiveReporting::FactModel subclass
      def register(model, fact_model)
        @fact_models[model] = fact_model
      end

      # Forgets all looked up and registered fact models
      def clear
        @fact_models.clear
      end

      private

      # Generated fact models are not assigned to a constant, so they never outlive a code reload or
      # stop a `[MyModel]FactModel` defined later from being autoloaded.
      def generate(model)
        label = "#{model.name}FactModel (generated)"
        Class.new(FactModel) do
          define_singleton_method(:to_s) { label }
          define_singleton_method(:inspect) { label }
          self.model = model
        end
      end
    end
  end
end
