# frozen_string_literal: true

module ActiveReporting
  class DimensionFilter
    attr_reader :name, :type, :body

    # Factory for creating a new DimensionFilter
    #
    # Determines the type based on if passed in a callable object or a symbol
    #
    # @param name (Symbol)
    # @param lambda_or_type (Symbol, Lambda)
    # @return (ActiveReporting::DimensionFilter) a new instance of a dimension filter
    def self.build(name, lambda_or_type)
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
