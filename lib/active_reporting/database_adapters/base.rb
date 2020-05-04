# frozen_string_literal: true

module ActiveReporting
  module DatabaseAdapters
    DatabaseNotSupported = Class.new(StandardError)
    MethodNotImplemented = Class.new(StandardError)
    # Database adapters are here to solve SQL problems in the
    # most idiomatic way in each database
    class Base
      attr_reader :name

      def initialize(name)
        @name = name
      end

      # @param [Symbol] interval
      # @return [Boolean]
      def allowed_datetime_hierarchy?(interval)
        datetime_hierarchies.include?(interval.try(:to_sym))
      end

      protected

      # Allowed datetime hierchies in each adapter
      # By default (:sqlite) there is none
      #
      # @return [Array<Symbol>]
      def datetime_hierarchies
        @datetime_hierarchies ||= []
      end
    end
  end
end
