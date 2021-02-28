
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
        shelter_index = 0
        row_index = 0
        flag = 0
        hash_of_books = Hash.new
        for shelter in shelters do
            for rows in shelter do
                row_index = 0
                column_index = 0
                for book in rows do
                    if book != 0
                        book_location = adapter.convert(shelter_index,column_index, row_index)
                        hash_of_books[book_location] = book
                        column_index +=1 
                    end
                end
                if flag == 1
                    break
                end
                row_index+=1
            end
            if flag == 1
                break
            end
            shelter_index+=1
        end

        
        printer = PrinterFactory.new_printer('library')
        response = printer.print(hash_of_books)

        return response
    end
end