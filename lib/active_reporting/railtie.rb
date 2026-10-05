# frozen_string_literal: true

module ActiveReporting
  class Railtie < Rails::Railtie
    initializer 'active_reporting.clear_fact_models_on_reload' do |app|
      app.reloader.before_class_unload { ActiveReporting::FactModelRegistry.clear }
    end
  end
end
