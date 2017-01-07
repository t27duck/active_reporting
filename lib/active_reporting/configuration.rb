module ActiveReporting
  module Configuration
    def self.config
      yield self
    end

    def self.default_dimension_label
      @default_dimension_label ||= :name
    end

    def self.default_dimension_label=(dl)
      @default_dimension_label = dl.to_sym
    end
  end
end
