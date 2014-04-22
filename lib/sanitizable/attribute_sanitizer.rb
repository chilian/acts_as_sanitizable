module Sanitizable
  class AttributeSanitizer
    attr_reader :name, :sanitizers, :sanitizer_procs, :context
    
    def initialize(name, options = {})
      @name = name
      @sanitizers = Array(options[:with])
      @sanitizer_procs = @sanitizers.map(&:to_proc)
      @context = options[:on]
    end

    def inspect
      "#<#{self.class.name} name: #{name.inspect}, sanitizers: #{sanitizers.inspect}, context: #{context.inspect}>"
    end

    def sanitize(value)
      @sanitizer_procs.inject(value) do |prev_value, sanitizer_proc|
        sanitizer_proc.call(prev_value)
      end
    end
  end
end