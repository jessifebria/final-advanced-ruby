require_relative 'build'
require_relative 'putbook'
require_relative 'takebook'
require_relative 'findbook'

class LibraryCommand
    def initialize
        @commands = Hash.new
        @commands["build_library"] = Build.new
        @commands["put_book"] = PutBook.new
        @commands["take_book_from"] = TakeBook.new
        @commands["find_book"] = FindBook.new
    end

    def execute(command,params)
        @commands[command].execute(params)
    end
end