require_relative 'printer'
require './book'
require_relative 'printerfactory'

class LibraryPrinter < Printer


    def print(hash_of_books)
        response = ""
        bookprinter = PrinterFactory.new_printer("book")
        for book_location in hash_of_books.keys   
            response += "#{book_location} : #{bookprinter.print(hash_of_books[book_location]) }\n"
        end
        response
    end
    
end