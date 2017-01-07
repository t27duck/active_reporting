module ActiveReporting
  class UnknownDimension < StandardError
    def initialize(name, fact_model)
      @name       = name
      @fact_model = fact_model
    end

    def message
      "Dimension '#{@name}' not found on fact model '#{@fact_model}'"
    end
    alias to_s message
  end
end
