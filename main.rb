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
        value = value.map(&:to_i) 
        if value[0]<1
            return "No Shelf added"
        end
        library = Library.new(value)
        return library.build

    elsif command == "put_book"
        if value.length != 3
            return "Invalid Value!"
        end
        return value
    else
        return "Invalid Command!"
    end
end


a = "|||"
b = a.split("|")

puts(b.length)