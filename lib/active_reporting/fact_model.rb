module ActiveReporting
  class FactModel
    class << self
      attr_reader :dimensions
    end

    def self.use_model(m)
      @model = m.is_a?(String) || m.is_a?(Symbol) ? m.to_s.classify.constantize : m
    end

    def self.model
      @model ||= name.gsub(/FactModel\z/, '').constantize
    end

    def self.dimension(name, label: :value)
      @dimensions ||= []
      @dimensions << Dimension.new(model, name: name.to_sym, label: label)
    end
  end
end
