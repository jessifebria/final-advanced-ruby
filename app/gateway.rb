require_relative 'library'
require_relative 'book'
require_relative 'command/librarycommand'
require_relative 'command/build'

class Gateway
  def initialize
    @librarycommand = LibraryCommand.new
    @array_commands = %w[build_library put_book take_book_from find_book list_books
                         search_books_by_title search_books_by_author]
  end

  def input_command(commands_from_user)
    command, params = parse_command(commands_from_user)
    if @array_commands.include? command
      @librarycommand.execute(command, params)
    else
      'Invalid Command!'
    end
  end

  private

  def parse_command(commands_from_user)
    array_of_commands = commands_from_user.split('|')
    command = array_of_commands[0]
    params = array_of_commands.slice(1, array_of_commands.length) if command != 'list_books'
    [command, params]
  end
end
