
require './library'
require './book'
require './index_to_booklocation_adapter'
require './printer/printerfactory'

class ListBooks

    def execute
        library = Library.instance
        hash_of_books = library.get_hash_of_books
        printer = PrinterFactory.new_printer('library')
        response = printer.print(hash_of_books)

        return response
    end
end