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