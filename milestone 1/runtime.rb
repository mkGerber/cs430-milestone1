#RUNTIME DICTIONARY

class Runtime

    def initialize
        @stored_variables = Hash.new
    end

    def set(name, node)
        @stored_variables[name] = node
    end
    
    def get(name)
        @stored_variables.fetch(name)
    end

end

    


