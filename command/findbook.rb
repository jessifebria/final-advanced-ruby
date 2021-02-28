require_relative 'command'
require './library'
require './book'
require './index_to_booklocation_adapter'

class FindBook < Command

    def validate(params)
        if (params.length != 1) or (num?(params[0].to_s) == false) or params[0].to_i<1
            return "Invalid Value!"
        end
        @isbn = params[0]
        return "valid"
    end

    def execute(params)
        message = validate(params)
        if message != "valid"
            return message
        end

        library = Library.instance
        shelter_index, row_index, column_index = library.find_book(@isbn)
        
        if shelter_index == -1 
            return "Book not found!"
        end

        adapter = IndexToBookLocationAdapter.new

        return "Found the book at #{adapter.convert(shelter_index, row_index, column_index)}"
    end
end