module ActiveReporting
  # This is included into every class that inherits from ActiveRecord::Base
  module ActiveRecordAdaptor
    # Returns the ActiveReporting::FactModel related to the model.
    #
    # If one is not explictily defined, a constant will be created which
    # inherits from ActiveReporting::Factmodel named [MyModel]FactModel
    #
    # @return [ActiveReporting::FactModel]
    def fact_model
      const_name = "#{name}FactModel"
      @fact_model ||= begin
                        const_name.constantize
                      rescue NameError
                        const = Object.const_set(const_name, Class.new(ActiveReporting::FactModel))
                        const.use_model self
                        const
                      end
    end
  end
end
