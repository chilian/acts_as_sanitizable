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
  #     sanitizes :content do |content|
  #       content.squish.downcase
  #     end
  #   end
  def sanitizes(*attribute_names, &block)
    options = attribute_names.extract_options!
    options.assert_valid_keys(:with)
    options.reverse_merge!(with: block_given? ? block : :strip)
    if sanitizer = options[:with]      
      unless sanitizer.respond_to?(:call) 
        sanitizer_name = sanitizer # this is necessary cuz of some strange behaviour
        sanitizer = -> (value) {           
          Array(sanitizer_name).inject(value) { |prev_value, method| prev_value.send(method) } 
        }        
      end
      before_validation options.slice(:on) do
       attribute_names.each do |attribute_name|
         attribute_value = send(attribute_name)
         send("#{attribute_name}=", sanitizer.call(attribute_value)) unless attribute_value.nil?
       end
      end
    end
  end
end

ActiveRecord::Base.extend(ActsAsSanitizable) if defined? ActiveRecord