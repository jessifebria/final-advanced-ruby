require_relative 'library'
require_relative 'book'
require_relative 'command/librarycommand'
require_relative 'command/build'

$library
class Main
    
    def initialize
       @librarycommand = LibraryCommand.new
    end

    def input_command(commands_from_user)
        command, params = parse_command(commands_from_user)
        response = @librarycommand.execute(command, params)
        return response
    end

    private def parse_command(commands_from_user)
        array_of_commands = commands_from_user.split("|")
        command = array_of_commands[0]
        params = array_of_commands.slice(1,array_of_commands.length)
        return command, params
    end
    
    private def execute_command(command,params)
        if command == "put_book"
            if params.length != 3 
                return "Invalid Value!"
            end
            isbn = params[0]
            title = params[1]
            author = params[2]
            if !(num?(isbn)) or (num?(author)) 
                return "Invalid Value!"
            end
            book = Book.new(isbn,title,author)

            return $library.put_book(book)
        else
            return "Invalid Command!"
        end
    end
end






# a = "|||"
# b = a.split("|")

# puts(b.length)