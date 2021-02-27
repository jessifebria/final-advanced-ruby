require_relative 'command'
require './library'
require './book'

class PutBook < Command

    @isbn
    @title
    @author

    def validate(params)
        if params.length != 3 
            return "Invalid Value!"
        end
        @isbn = params[0]
        @title = params[1]
        @author = params[2]
        if !(num?(@isbn)) or (num?(@author)) 
            return "Invalid Value!"
        end
        
        return "valid"
    end

    def execute(params)
        message = validate(params)
        if message != "valid"
            return message
        end
        book = Book.new(@isbn,@title,@author)
        library = Library.instance
        shelters = library.shelters

        shelter_index = 0
        row_index = 0
        for shelter in shelters do
            for rows in shelter do
                row_index = 0
                column_index = rows.index("0")
                if column_index.is_a?Integer 
                    flag = 1
                    shelters[shelter_index][row_index][column_index] = book
                    break
                end
                row_index+=1
            end
            if flag == 1
                break
            end
            shelter_index+=1
        end
        
        return "Allocated address: #{(shelter_index+1).to_s.rjust(2, "0")}#{(row_index+1).to_s.rjust(2, "0")}#{(column_index+1).to_s.rjust(2, "0")}"
    end
end