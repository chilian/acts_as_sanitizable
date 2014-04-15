require 'rubygems'
require 'active_record'


module ActsAsSanitizable
  # use sanitizes concern to modify strings on specified fields
  #
  # -----
  #
  # === Example:
  #   class User < ActiveRecord::Base   
  #     sanitizes :content, with: :squish
  #     sanitizes :content, :another_attribute, :nth_attribute, with: [:strip, :upcase]
  #     sanitizes :content do |content|
  #       content.squish.downcase
  #     end
  #     sanitizes :content, with: ->(content) { content.squish.downcase }
  #   end
  def sanitizes(*attribute_names, &block)
    options = attribute_names.extract_options!.assert_valid_keys(:with, :on).reverse_merge(with: block_given? ? block : :strip)
 
    attribute_sanitizers = Array(options[:with]).map(&:to_proc)
    
    if attribute_sanitizers.any?
      before_validation options.slice(:on) do
        attribute_names.each do |attribute_name|
          attribute_value = self.send(attribute_name)
          unless attribute_value.nil?
            sanitized_value = attribute_sanitizers.inject(attribute_value) do |prev_value, sanitizer_proc|
              sanitizer_proc.call(prev_value)
            end
            self.send("#{attribute_name}=", sanitized_value) 
          end
        end
      end
    end
  end
end

ActiveRecord::Base.extend(ActsAsSanitizable) if defined? ActiveRecord