require_relative 'command'
require './library'
require './book'
require './booklocation_to_index_adapter'

class TakeBook < Command

    
    def validate(params)
        if (params.length != 1) or (num?(params[0]) == false) or (params[0].length!=6) or params[0].to_i<1
            return "Invalid Value!"
        end

        @book_location = params[0].to_i

        adapter = BookLocationToIndexAdapter.new
        @shelter_index, @row_index, @column_index = adapter.convert(@book_location)

        @library = Library.instance
        
        if @library.is_index_exceed?(@shelter_index,@row_index,@column_index)
            return "You exceed limit capacity!"
        end
    
        return "valid"
    end

    def execute(params)
        message = validate(params)
        if message != "valid"
            return message
        end

        

        

        message = library.take_book(shelter_index, row_index, column_index)
        return message
    end
end