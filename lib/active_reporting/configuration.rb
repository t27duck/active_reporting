module ActiveReporting
  module Configuration
    class << self
      attr_accessor :ransack_available
    end

    def self.config
      yield self
    end

    def self.default_dimension_label
      @default_dimension_label ||= :name
    end

    def self.default_dimension_label=(dl)
      @default_dimension_label = dl.to_sym
    end

    def self.default_measure
      @default_measure ||= :value
    end

    def self.default_measure=(dm)
      @default_measure = dm.to_sym
    end

    def self.ransack_fallback
      @ransack_fallback ||= false
    end

    def self.ransack_fallback=(rf)
      raise RansackNotAvailable unless ransack_available
      @ransack_fallback = rf
    end
  end
end
