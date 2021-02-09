require_relative 'library'

def input_command(commands)
    commands_arr = commands.split("|")
    command = commands_arr[0]
    value = commands_arr.slice(1,commands_arr.length)
    if command == "build_library"
        if value.length != 3
            return "Invalid Value!"
        end
        for i in value
            if i.to_i.to_s != i 
                return "Invalid Value, It must be an integer!"
            end
        end
        return value.map(&:to_i)
    end
    return null
end


a = "|||"
b = a.split("|")

puts(b.length)