require_relative 'command'

class SearchBookByAuthor < Command
    
    def validate(params)
        if (params.length != 1)
            return "Invalid Value!"
        end
        return "valid"
    end

    def execute(params)
        message = validate(params)
        if message != "valid"
            return message
        end
    end
    
end
