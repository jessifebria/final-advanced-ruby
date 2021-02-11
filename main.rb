require_relative 'library'

$library
class Main
    
    def input_command(commands_from_user)
        command, params = parse_command(commands_from_user)
        response = execute_command(command,params)
        return response
    end

    private def num?(string)
        return string.to_i.to_s == string
    end

    private def parse_command(commands_from_user)
        array_of_commands = commands_from_user.split("|")
        command = array_of_commands[0]
        params = array_of_commands.slice(1,array_of_commands.length)
        return command, params
    end
    
    private def execute_command(command,params)
        if command == "build_library"
            if params.length != 3
                return "Invalid Value!"
            end
            for param in params
                if !num?(param)
                    return "Invalid Value, It must be an integer!"
                end
            end
            params = params.map(&:to_i) 
            if params[0]<1
                return "No Shelf added"
            end
    
            $library = Library.new(params)
            return $library.build
    
        elsif command == "put_book"
            if params.length != 3 
                return "Invalid Value!"
            end
            isbn = params[0]
            title = params[1]
            author = params[2]
            if !(num?(isbn)) or (num?(author)) 
                return "Invalid Value!"
            end
    
            return $library.put_book([isbn, title, author])
    
        else
            return "Invalid Command!"
        end
    end
end






# a = "|||"
# b = a.split("|")

# puts(b.length)