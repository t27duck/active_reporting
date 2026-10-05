# frozen_string_literal: true

require 'active_record'
require 'active_reporting/active_record_adaptor'
require 'active_reporting/configuration'
require 'active_reporting/datetime_drill'
require 'active_reporting/dimension'
require 'active_reporting/dimension_filter'
require 'active_reporting/metric'
require 'active_reporting/fact_model'
require 'active_reporting/fact_model_registry'
require 'active_reporting/report'
require 'active_reporting/reporting_dimension'
require 'active_reporting/version'
require 'active_reporting/railtie' if defined?(Rails::Railtie)

ActiveSupport.on_load(:active_record) { extend ActiveReporting::ActiveRecordAdaptor }

module ActiveReporting
  def self.fetch_metric(name)
    klass_name = Configuration.metric_lookup_class
    klass = klass_name.safe_constantize
    if klass.nil?
      raise BadMetricLookupClass,
            "#{klass_name} not defined. Please define a class responsible for looking up a metric by name." \
            ' You may define your own class and set it with `ActiveReporting::Configuration.metric_lookup_class=`.'
    end
    unless klass.respond_to?(:lookup)
      raise BadMetricLookupClass, "#{klass_name} needs to define a class method called 'lookup'"
    end

    klass.lookup(name)
  end

  BadMetricLookupClass    = Class.new(StandardError)
  InvalidDimensionLabel   = Class.new(StandardError)
  # Subclasses RuntimeError, which was raised for invalid directions before this class existed
  InvalidOrderDirection   = Class.new(RuntimeError)
  RansackNotAvailable     = Class.new(StandardError)
  UnknownAggregate        = Class.new(StandardError)
  UnknownDimension        = Class.new(StandardError)
  UnknownDimensionFilter  = Class.new(StandardError)
  UnknownMetric           = Class.new(StandardError)
  UnknownJoinMethod       = Class.new(StandardError)
end
