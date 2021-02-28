require_relative 'printer'
require './book'

def BookPrinter < Printer

    def print(book)
        "#{book.isbn} | #{book.title} | #{book.author}"
    end
    
end