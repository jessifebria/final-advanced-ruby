require_relative 'build'
require_relative 'putbook'
require_relative 'takebook'
require_relative 'findbook'
require_relative 'listbooks'

class LibraryCommand
    def initialize
        @commands = Hash.new
        @commands["build_library"] = Build.new
        @commands["put_book"] = PutBook.new
        @commands["take_book_from"] = TakeBook.new
        @commands["find_book"] = FindBook.new
        @commands["list_books"] = ListBooks.new
    end

    def execute(command,params)
        if params==nil
            @commands[command].execute
        else
            @commands[command].execute(params)
        end
    end

end