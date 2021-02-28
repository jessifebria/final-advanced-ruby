
require './library'
require './book'
require './index_to_booklocation_adapter'
require './printer/printerfactory'

class ListBooks

    def execute
        adapter = IndexToBookLocationAdapter.new
        response = ""
        library = Library.instance
        shelters = library.shelters
        hash_of_books = Hash.new
        for shelter_index in 0...shelters.length do
            for row_index in 0...shelters[shelter_index].length do
                for column_index in 0...shelters[shelter_index][row_index].length do
                    if shelters[shelter_index][row_index][column_index] != 0
                        book_location = adapter.convert(shelter_index,column_index, row_index)
                        hash_of_books[book_location] = shelters[shelter_index][row_index][column_index]
                    end
                end
            end
        end

        printer = PrinterFactory.new_printer('library')
        response = printer.print(hash_of_books)

        return response
    end
end