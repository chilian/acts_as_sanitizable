module Sanitizable
  module Macro
    # Defines one or multiple columns that should be sanitized. The method used
    # for sanitizing can be defined via the :with key and can either contain the name
    # of any method that is implemented on the particular class or a custom Proc.
    # Additionally, an Array of Symbols or Procs can be speficied. Alternatively a block
    # can be supplied as sanitizer.
    #
    # -----
    #
    # === Example:
    #   class User < ActiveRecord::Base   
    #     sanitizes :content, with: :squish
    #     sanitizes :name, :content, :description, with: [:strip, :upcase]
    #     sanitizes :content do |content|
    #       content.squish.downcase
    #     end
    #     sanitizes :content, with: ->(content) { content.squish.downcase }
    #   end
    def sanitizes(*attribute_names, &block)  
      include Model unless self.include?(Model)

      options = attribute_names.extract_options!.assert_valid_keys(:with, :on)
      options[:with] = block || options[:with]
      raise ArgumentError, "#{self.name}#sanitizes must define a :with option or have block" unless options[:with]
      raise ArgumentError, "#{self.name}#sanitizes must define at least one attribute" if attribute_names.empty?

      @sanitizable_attributes ||= []
      @sanitizable_attributes += attribute_names.map do |attribute_name|
        AttributeSanitizer.new(attribute_name.to_s, options.dup)
      end
      @sanitizable_attributes.uniq!
    end

    def acts_as_sanitizable(*attribute_names, &block)
      sanitizes(*attribute_names, &block)
    end

    def skip_sanitization_of(*attribute_names)
      if self.include?(Model)
        options = attribute_names.extract_options!.assert_valid_keys(:on)
        attribute_names = attribute_names.map(&:to_s)
        context = options[:on]
        @sanitizable_attributes.delete_if do |attribute|
          attribute_names.include?(attribute.name) and context == attribute.context
        end
      end
    end

    def skip_sanitization_on(*attribute_names)
      skip_sanitization_of(*attribute_names)
    end

    def reset_sanitization
      sanitizable_attributes.clear if self.include?(Model)
    end
  end
end

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.extend(Sanitizable::Macro)
end
