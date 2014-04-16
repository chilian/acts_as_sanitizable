module Sanitizable
  class AttributeSanitizer
    attr_reader :name, :sanitizers, :context
    
    def initialize(name, options = {})
      @name = name
      @sanitizers = Array(options[:with]).map(&:to_proc)
      @context = options[:on]
    end

    def inspect
      "#<#{self.class.name} name: #{name.inspect}, sanitizers: #{sanitizers.inspect}, context: #{context.inspect}>"
    end
  end
end