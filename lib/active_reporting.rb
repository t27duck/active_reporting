# frozen_string_literal: true

require 'active_record'
require 'active_reporting/active_record_adaptor'
require 'active_reporting/configuration'
require 'active_reporting/dimension'
require 'active_reporting/dimension_filter'
require 'active_reporting/metric'
require 'active_reporting/fact_model'
require 'active_reporting/report'
require 'active_reporting/reporting_dimension'
require 'active_reporting/version'

begin
  require 'ransack'
  ActiveReporting::Configuration.ransack_available = true
rescue LoadError, StandardError
  ActiveReporting::Configuration.ransack_available = false
end

ActiveRecord::Base.extend(ActiveReporting::ActiveRecordAdaptor)

module ActiveReporting
  def self.fetch_metric(name)
    klass = Configuration.metric_lookup_class
    unless defined?(klass.constantize)
      raise BadMetricLookupClass,
            "#{klass} not defined. Please define a class responsible for looking up a metric by name." \
            ' You may define your own class and set it with `ActiveReporting::Configuration.metric_lookup_class=`.'
    end
    unless klass.constantize.respond_to?(:lookup)
      raise BadMetricLookupClass, "#{klass} needs to define a class method called 'lookup'"
    end
    klass.constantize.lookup(name)
  end

  BadMetricLookupClass    = Class.new(StandardError)
  InvalidDimensionLabel   = Class.new(StandardError)
  RansackNotAvailable     = Class.new(StandardError)
  UnknownAggregate        = Class.new(StandardError)
  UnknownDimension        = Class.new(StandardError)
  UnknownDimensionFilter  = Class.new(StandardError)
  UnknownMetric           = Class.new(StandardError)
  UnknownJoinMethod       = Class.new(StandardError)
end
