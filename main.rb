require_relative 'library'

def input_command(command)
    command_arr = command.split("|")
    if command_arr[0] == "build_library"
        return command_arr.slice(1,3).map(&:to_i)
    end
    return null
end
