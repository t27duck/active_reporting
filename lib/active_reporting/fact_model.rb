module ActiveReporting
  class FactModel
    class << self
      attr_reader :dimensions, :dimension_filters
      attr_writer :measure
    end

    # Explicitly sets which ActiveRecord model to to link to this fact model.
    #
    # @note You should only need to set this if the name of your fact model does not
    #   follow the pattern of [MyModel]FactModel
    #
    # @param model [String, Symbol, Class]
    # @return [Class] the ActiveRecord model
    #
    # @example
    #   class PostFactModel < ActiveReporting::FactModel
    #     self.model= :post
    #     self.model= Post
    #     self.model= 'post'
    #   end
    def self.model=(model)
      @model = if model.is_a?(String) || model.is_a?(Symbol)
                 model.to_s.classify.constantize
               else
                 model
               end
      @model.instance_variable_set('@fact_model', self)
      @model
    end

    # Returns the ActiveRecord model linked to the FactModel.
    #
    # If not already set, FactModel assumes the model is based off of the name of the class
    #
    # @example
    #   class PostFactModel < ActiveReporting::FactModel
    #   end
    #
    #   PostFactModel.model
    #   => Post
    #
    # @return [Class] the ActiveRecord model
    def self.model
      @model ||= name.gsub(/FactModel\z/, '').constantize
    end

    # The default measure used when this fact model is reported on
    #
    # @return [Symbol]
    def self.measure
      @measure ||= Configuration.default_measure
    end

    # The (in order) hierarchical levels of the fact model when used as
    # a dimension.
    #
    # @return [Array]
    def self.hierarchical_levels
      @hierarchical_levels ||= []
    end

    # Specifies an in order array of columns which describes a series of
    # columns that may be used as dimensions in a hierarchy.
    #
    # For example, a fact model of tablets may have a hierarchy of
    # name -> manufacturer -> operating system.
    #
    # @param levels (Array) An array of symbols or strings of columns
    def self.dimension_hierarchy(levels)
      @hierarchical_levels = Array(levels).map(&:to_sym)
    end

    # When this fact model is used as a dimension, this is the label it will
    # use by default
    #
    # @return [Symbol]
    def self.default_dimension_label(label)
      @dimension_label = label.to_sym
    end

    # Returns the dimension label used when this fact model is used as a dimension
    #
    # @return [Symbol]
    def self.dimension_label
      @dimension_label || Configuration.default_dimension_label
    end

    # Declares a dimension for this fact model
    #
    # @param name [String, Symbol] The name of the dimension
    def self.dimension(name)
      @dimensions ||= {}
      @dimensions[name.to_sym] = Dimension.new(self, name: name)
    end

    # Returns a hash of dimension label to callback mappings
    #
    # @return [Hash]
    def self.dimension_label_callbacks
      @dimension_label_callbacks ||= {}
    end

    # Sets a call back for a given dimension label. The returned value of
    # the callable body will be used as the label value when used in a report.
    # The label's raw database value is passed to the callback.
    #
    # @param column [Symbol, String]
    # @param body [Lambda]
    def self.dimension_label_callback(column, body)
      @dimension_label_callbacks ||= {}
      raise ArgumentError, "Dimension label callback body must be a callable object" unless body.respond_to?(:call)
      @dimension_label_callbacks[column.to_sym] = body
    end

    # Declares a dimension filter for this fact model
    #
    # @param name [Stirng, Symbol] The name of the dimension filter
    # @param lambda_or_type [Symbol, Lambda]
    #
    # @note If not provided, the type of the dimension filter will be a scope.
    #   Meaning the ActiveReporting is assuming there's a scope on the fact
    #   model's model named the same. You may pass in `:ransack` to say this
    #   dimension filter is a ransack search term. Finally, you may pass in
    #   a callable object similar to defining a scope on ActiveRecord
    #
    # @example
    #   class PostFactModel < ActiveReporting::FactModel
    #     # Assumes there's an `active` scope on the model
    #     dimension_filter :active
    #
    #     # Uses the ransack search term `joined_at_gte`
    #     dimension_filter :joined_at_gte, :ransack
    #
    #     # Implements a dimension filter like an ActiveRecord scope
    #     dimension_filter :some_filter, ->(input) { where(foo: input) }
    #   end
    def self.dimension_filter(name, lambda_or_type = :scope)
      @dimension_filters ||= {}
      @dimension_filters[name.to_sym] = DimensionFilter.build(name, lambda_or_type)
    end

    # Invoke this method to make all dimension filters fallback to use ransack
    # if they are not defined as scopes on the model
    def self.use_ransack_for_unknown_dimension_filters
      raise RansackNotAvailable, 'Ransack not available. Please include it in your Gemfile.' unless Configuration.ransack_available
      @ransack_fallback = true
    end

    # Tells if unknown dimension filters fallback to use ransack
    #
    # @return [Boolean]
    def self.ransack_fallback
      @ransack_fallback || Configuration.ransack_fallback
    end
    private_class_method :ransack_fallback

    # Finds a dimension filter defined on a fact model given a name
    #
    # @param name [Symbol]
    # @return [ActiveReporting::DimensionFilter]
    def self.find_dimension_filter(name)
      @dimension_filters ||= {}
      dm = @dimension_filters[name.to_sym]
      return dm if dm.present?
      return @dimension_filters[name.to_sym] = DimensionFilter.build(name, :ransack) if ransack_fallback
      raise UnknownDimensionFilter, "Dimension filter '#{name}' not found on fact model '#{self.name}'"
    end
  end
end
