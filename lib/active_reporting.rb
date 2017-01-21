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
rescue
  ActiveReporting::Configuration.ransack_available = false
end

ActiveRecord::Base.extend(ActiveReporting::ActiveRecordAdaptor)

module ActiveReporting
  class UnknownDimension < StandardError
    def initialize(name, fact_model)
      @name       = name
      @fact_model = fact_model
    end

    def message
      "Dimension '#{@name}' not found on fact model '#{@fact_model}'"
    end
    alias to_s message
  end

  class UnknownAggregate < StandardError
    def initialize(name)
      @name = name
    end

    def message
      "Unknown aggregate '#{@name}'"
    end
    alias to_s message
  end

  class UnknownDimensionFilter < StandardError
    def initialize(name, fact_model)
      @name       = name
      @fact_model = fact_model
    end

    def message
      "Dimension filter '#{@name}' not found on fact model '#{@fact_model}'"
    end
    alias to_s message
  end

  class RansackNotAvailable
    def message
      'Ransack is not available. Please include it in your Gemfile.'
    end
    alias to_s message
  end
end
