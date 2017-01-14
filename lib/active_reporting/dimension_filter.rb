module ActiveReporting
  class DimensionFilter
    attr_reader :type, :body

    def self.build(fact_model, name, lambda_or_type)
      body = nil
      type = lambda_or_type

      if lambda_or_type.respond_to?(:call)
        body = lambda_or_type
        type = :lambda
      end

      new(name, type, body)
    end

    def initialize(name, type = :scope, body = nil)
      @name = name.to_sym
      @type = type.to_sym
      @body = body
    end
  end
end
