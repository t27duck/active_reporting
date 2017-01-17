module ActiveReporting
  module ActiveRecordAdaptor
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
