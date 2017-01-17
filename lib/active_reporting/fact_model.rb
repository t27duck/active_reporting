module ActiveReporting
  class FactModel
    class << self
      attr_reader :dimensions, :dimension_filters
      attr_writer :measure
    end

    def self.use_model(m)
      @model = if m.is_a?(String) || m.is_a?(Symbol)
                 m.to_s.classify.constantize
               else
                 m
               end
      @model.instance_variable_set('@fact_model', self)
      @model
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
      @dimension_filters ||= {}
      @dimension_filters[name.to_sym] = DimensionFilter.build(self, name, lambda_or_type)
    end

    def self.use_ransack_for_unknown_dimension_filters
      raise RansackNotAvailable unless ransack_available
      @ransack_fallback = true
    end

    def self.ransack_fallback
      @ransack_fallback || Configuration.ransack_fallback
    end
    private_class_method :ransack_fallback

    def self.find_dimension_filter(name)
      @dimension_filters ||= {}
      dm = @dimension_filters[name]
      return dm if dm.present?
      return @dimension_filters[name] = Dimension.build(self, name, :ransack) if ransack_fallback
      raise UnknownDimensionFilter.new(name, self.name)
    end
  end
end
