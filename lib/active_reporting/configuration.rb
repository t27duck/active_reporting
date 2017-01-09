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
  end
end
