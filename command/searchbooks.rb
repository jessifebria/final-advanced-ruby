require_relative 'command'
require './library'

class SearchBooks < Command
    
    def initialize(type)
        @type = type
    end

    def validate(params)
        if (params.length != 1)
            return "Invalid Value!"
        end
        @keyword = params[0]
        return "valid"
    end

    def execute(params)
        message = validate(params)
        if message != "valid"
            return message
        end
        
        library = Library.instance
        hash_of_books = library.searchbooks(@type, @keyword)
        
        if hash_of_books.empty?
            return "Book not found!"
        end

        printer = PrinterFactory.new_printer('library')
        response = printer.print(hash_of_books)

        return response

    end
    
end
