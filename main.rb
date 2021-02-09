require_relative 'library'

def input_command(command)
    library = Library.new(2,1,3)
    return library.build
end
