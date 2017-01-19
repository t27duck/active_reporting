module ActiveReporting
  module Configuration
    class << self
      # Determines if ransack is available for use in the gem
      #
      # @return [Boolean]
      attr_accessor :ransack_available
    end

    def self.config
      yield self
    end

    # The default label used by all dimensions if not set otherwise
    #
    # Default value is `:name`
    def self.default_dimension_label
      @default_dimension_label ||= :name
    end

    # Sets the default dimension label to be used by all dimensions
    #
    # @param dimension_label [String, Symbol]
    # @return [Symbol]
    def self.default_dimension_label=(dimension_label)
      @default_dimension_label = dimension_label.to_sym
    end

    # The default measture for all fact models
    #
    # Default value is `:value``
    def self.default_measure
      @default_measure ||= :value
    end

    # Sets the default measture to be used by all fact models
    #
    # @param measure [String, Symbol]
    # @return [Symbol]
    def self.default_measure=(measure)
      @default_measure = measure.to_sym
    end

    # Tells if unkown dimension filters should always fallback to ransack
    #
    # Default value is `false`
    #
    # @return [Boolean]
    def self.ransack_fallback
      @ransack_fallback ||= false
    end

    # Sets the flag to always fallback to ransack for unknown dimension filters
    # @param fallback [Boolean]
    # @return [Boolean]
    def self.ransack_fallback=(fallback)
      raise RansackNotAvailable unless ransack_available
      @ransack_fallback = fallback
    end
  end
end
