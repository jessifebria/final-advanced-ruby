require_relative 'printer'
require './book'
require_relative 'bookprinter'

class LibraryPrinter < Printer

    def initialize(hash_of_books) 
        @hash_of_books = hash_of_books
    end

    def print
        response = ""
        bookprinter = BookPrinter.new
        for book_location in @hash_of_books.keys     
            response += "#{book_location} : #{bookprinter.print(@hash_of_books[book_location])}\n"
        end
    end
    
end