module ActiveReporting
  class FactModel
    class << self
      attr_reader :dimensions, :dimension_filters
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

    def self.dimension_filter(name, lambda_or_type = :scope)
      body = nil
      type = lambda_or_type

      if lambda_or_type.respond_to?(:call)
        body = lambda_or_type
        type = :lambda
      end

      @dimension_filters ||= {}
      @dimension_filters[name.to_sym] = DimensionFilter.new(name, type, body)
    end

    def self.find_dimension_filter(name)
      @dimension_filters ||= {}
      dm = @dimension_filters[name.to_sym]
      raise UnknownDimensionFilter.new(name, self.name) if dm.blank?
      dm
    end
  end
end
