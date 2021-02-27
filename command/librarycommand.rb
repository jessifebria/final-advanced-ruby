require_relative 'build'

class LibraryCommand
    def initialize
        @commands = Hash.new
        @commands["build_library"] = Build.new
    end

    def execute(command,params)
        puts @commands[command]
        @commands[command].execute(params)
    end
end