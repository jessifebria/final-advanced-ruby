require_relative 'command'
require './library'

class Build < Command

    def validate
        if @params.length != 3
            return "Invalid Value!"
        end
        for param in @params
            if !num?(param)
                return "Invalid Value, It must be an integer!"
            end
        end
        @params = @params.map(&:to_i) 
        if @params[0]<1
            return "No Shelf added"
        end
        @n = @params[0]
        @x = @params[1]
        @y = @params[2]
        return "valid"
    end

    def execute(params)
        @params = params
        message = validate
        if message != "valid"
            return message 
        end 
        
        Library.createinstance([@n,@x,@y])
        
        return printresult
    end

    def printresult
        message = "Shelf 1 with #{@x} rows and #{@y} columns is added"
        for i in 2..@n do
            message += "\nShelf #{i} with #{@x} rows and #{@y} columns is added"
        end
        return message
    end
end