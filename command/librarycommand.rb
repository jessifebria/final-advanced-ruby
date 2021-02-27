require_relative 'build'
require_relative 'putbook'

class LibraryCommand
    def initialize
        @commands = Hash.new
        @commands["build_library"] = Build.new
        @commands["put_book"] = PutBook.new
    end

    def execute(command,params)
        @commands[command].execute(params)
    end
end