require_relative 'command'
require './library'
require './book'
require './index_to_booklocation_adapter'

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
        shelter_index, row_index, column_index = library.put_book(book)
        
        # puts "LIBRARY ", library
        adapter = IndexToBookLocationAdapter.new

        return "Allocated address: #{adapter.convert(shelter_index, row_index, column_index)}"
    end
end