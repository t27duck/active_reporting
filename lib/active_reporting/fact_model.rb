module ActiveReporting
  class FactModel
    class << self
      attr_reader :dimensions
      attr_writer :measure
    end

    def self.use_model(m)
      @model = m.is_a?(String) || m.is_a?(Symbol) ? m.to_s.classify.constantize : m
    end

    def self.model
      @model ||= name.gsub(/FactModel\z/, '').constantize
    end

    def self.measure
      @measure ||= Configuration.default_measure
    end

    def self.dimension(name, label: Configuration.default_dimension_label)
      @dimensions ||= {}
      @dimensions[name.to_sym] = Dimension.new(model, name: name.to_sym, label: label)
    end
  end
end
