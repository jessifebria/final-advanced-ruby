require_relative 'printer'
require './book'
require_relative 'bookprinter'

def LibraryPrinter < Printer

    def print(hash_of_books)
        response = ""
        bookprinter = BookPrinter.new
        for book_location in hash_of_books.keys     
            response += "#{book_location} : #{bookprinter.print(hash_of_books[book_location])}\n"
        end
    end
    
end