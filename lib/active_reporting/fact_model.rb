module ActiveReporting
  class FactModel
    def self.use_model(m)
      @model = m.is_a?(String) || m.is_a?(Symbol) ? m.to_s.classify.constantize : m
    end

    def self.model
      @model ||= name.gsub(/FactModel\z/, '').constantize
    end
  end
end
