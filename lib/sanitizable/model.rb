require 'active_support/concern'

module Sanitizable
  module Model
    extend ActiveSupport::Concern

    included do
      before_validation :_sanitize_attributes
    end

    module ClassMethods
      def inherited(base)
        base.instance_variable_set(:@sanitizable_attributes, sanitizable_attributes.dup)
      end

      def sanitizable_attributes
        @sanitizable_attributes ||= []
      end

      def sanitizable_attribute_names
        sanitizable_attributes.collect(&:name).uniq.freeze
      end
    end

    private
    def _sanitize_attributes
      self.class.sanitizable_attributes.each do |attribute|
        if _sanitizable_in_context?(attribute.context)
          original_value = self.send(attribute.name)
          unless original_value.nil?
            sanitized_value = attribute.sanitize(original_value)
            self.send("#{attribute.name}=", sanitized_value) 
          end
        end
      end
    end

    def _sanitizable_in_context?(context)
      actual_context = new_record? ? :create : :update
      context.nil? or (!context.nil? and context == actual_context)
    end
  end
end