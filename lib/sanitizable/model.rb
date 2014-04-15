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
      context = new_record? ? :create : :update
      self.class.sanitizable_attributes.each do |attribute|
        if attribute.context.nil? or (!attribute.context.nil? and attribute.context == context)
          original_value = self.send(attribute.name)
          unless original_value.nil?
            sanitized_value = attribute.sanitizers.inject(original_value) do |prev_value, sanitizer_proc|
              sanitizer_proc.call(prev_value)
            end
            self.send("#{attribute.name}=", sanitized_value) 
          end
        end
      end
    end
  end
end