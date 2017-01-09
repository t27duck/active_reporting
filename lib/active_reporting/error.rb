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

  class UnknownAggregate < StandardError
    def initialize(name)
      @name = name
    end

    def message
      "Unknown aggregate '#{@name}'"
    end
    alias to_s message
  end

  class UnknownDimensionFilter < StandardError
    def initialize(name, fact_model)
      @name       = name
      @fact_model = fact_model
    end

    def message
      "Dimension filter '#{@name}' not found on fact model '#{@fact_model}'"
    end
    alias to_s message
  end
end
