require_relative 'library'
require_relative 'book'
require_relative 'command/librarycommand'
require_relative 'command/build'

$library
class Main
    
    def initialize
       @librarycommand = LibraryCommand.new
       @array_commands = ["build_library", "put_book","take_book_from" , "find_book", "list_books", "search_books_by_title", "search_books_by_author"]
        
    end

    def input_command(commands_from_user)
        command, params = parse_command(commands_from_user)
        if @array_commands.include? command
            response = @librarycommand.execute(command, params)
        else 
            response = "Invalid Command!"
        end
        return response
    end

    private def parse_command(commands_from_user)
        array_of_commands = commands_from_user.split("|")
        command = array_of_commands[0]
        if command != "list_books"
            params = array_of_commands.slice(1,array_of_commands.length)
        end
        return command, params
    end

end

# main = Main.new

# while true do
#     user_input = gets.chomp
#     if user_input == "end"
#         break
#     end
#     puts main.input_command(user_input)
    
# end