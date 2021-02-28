require_relative 'printer'
require './book'
require_relative 'bookprinter'

class LibraryPrinter < Printer

    def initialize(hash_of_books) 
        @hash_of_books = hash_of_books
    end

    def print
        response = ""
        for book_location in @hash_of_books.keys   
            bookprinter = BookPrinter.new(@hash_of_books[book_location])  
            response += "#{book_location} : #{bookprinter.print}\n"
        end
        response
    end
    
end