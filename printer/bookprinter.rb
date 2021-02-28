require_relative 'printer'
require './book'

class BookPrinter < Printer

    def initialize(book)
        @book = book
    end

    def print
        "#{@book.isbn} | #{@book.title} | #{@book.author}"
    end
    
end