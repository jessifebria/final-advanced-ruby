require_relative 'printer'
require './book'

def BooksPrinter < Printer

    def print(book)
        "#{book.isbn} | #{book.title} | #{book.author}"
    end
    
end