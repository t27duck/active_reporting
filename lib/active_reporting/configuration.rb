# frozen_string_literal: true

module ActiveReporting
  module Configuration
    # The default label used by all dimensions if not set otherwise
    #
    # Default value is `:name`
    #
    # @return [Symbol]
    mattr_reader :default_dimension_label, default: :name

    # The default measure for all fact models
    #
    # Default value is `:value`
    #
    # @return [Symbol]
    mattr_reader :default_measure, default: :value

    # Tells if unknown dimension filters should always fallback to ransack
    #
    # Default value is `false`
    #
    # @return [Boolean]
    mattr_reader :ransack_fallback, default: false

    # Returns the name of the constant used to lookup prebuilt `ActiveReporting::Metric`
    # objects by name. The constant should define a class method called `#lookup`
    # which can take a string or symbol of the metric name.
    #
    # Default value is `::Metric`
    #
    # @return [String]
    mattr_reader :metric_lookup_class, default: '::Metric'

    def self.config
      yield self
    end

    # `mattr_reader` stores values in class variables, so the custom writers below set them directly.
    # Configuration is never included into other classes, so class variable sharing is not a concern.
    # rubocop:disable Style/ClassVars

    # Determines if ransack is available for use in the gem. Ransack is loaded the first time this is
    # called, so it does not matter whether it is required before or after ActiveReporting.
    #
    # @return [Boolean]
    def self.ransack_available
      return @@ransack_available if defined?(@@ransack_available)

      @@ransack_available = begin
        require 'ransack'
        true
      rescue LoadError
        false
      end
    end

    # Overrides ransack detection
    #
    # @param available [Boolean]
    def self.ransack_available=(available)
      @@ransack_available = available
    end

    # Sets the default dimension label to be used by all dimensions
    #
    # @param dimension_label [String, Symbol]
    # @return [Symbol]
    def self.default_dimension_label=(dimension_label)
      @@default_dimension_label = dimension_label.to_sym
    end

    # Sets the default measure to be used by all fact models
    #
    # @param measure [String, Symbol]
    # @return [Symbol]
    def self.default_measure=(measure)
      @@default_measure = measure.to_sym
    end

    # Sets the flag to always fallback to ransack for unknown dimension filters
    #
    # @param fallback [Boolean]
    # @return [Boolean]
    def self.ransack_fallback=(fallback)
      raise RansackNotAvailable if fallback && !ransack_available

      @@ransack_fallback = fallback
    end

    # Sets the name of the constant used to lookup prebuilt `ActiveReporting::Metric`
    # objects by name.
    #
    # @param klass_name [String, Symbol, Class]
    def self.metric_lookup_class=(klass_name)
      @@metric_lookup_class = "::#{klass_name.to_s.camelize.delete_prefix('::')}"
    end
    # rubocop:enable Style/ClassVars
  end
end
