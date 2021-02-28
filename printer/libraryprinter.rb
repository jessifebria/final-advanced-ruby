require_relative 'printer'
require './book'

def BooksPrinter < Printer

    def print(hash_of_books)
        response = ""
        for book_location in hash_of_books.keys     
            response += "#{book_location} : #{hash_of_books[book_location].print_detail}\n"
        end
    end
    
end