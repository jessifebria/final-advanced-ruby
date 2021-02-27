require_relative 'command'
require './library'
require './book'
require './booklocation_to_index_adapter'

class TakeBook < Command

    def validate(params)
        if (params.length != 1) or (params[0].num? == false)
            return "Invalid Value"
        end
        @book_location = params[0].to_i
        return "valid"
    end

    def execute(params)
        message = validate(params)
        if message != "valid"
            return message
        end

        library = Library.instance

        adapter = BookLocationToIndexAdapter.new
        shelter_index, row_index, column_index = adapter.convert(@book_location)

        library.take_book(shelter_index, row_index, column_index)
    end
end