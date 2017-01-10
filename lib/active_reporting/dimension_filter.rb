module ActiveReporting
  class DimensionFilter
    attr_reader :type, :body

    def initialize(name, type = :scope, body = nil)
      @name = name.to_sym
      @type = type
      @body = body
    end
  end
end
