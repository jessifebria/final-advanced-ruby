require_relative 'printer'
require './app/book'

class BookPrinter < Printer
  def print(book)
    "#{book.isbn} | #{book.title} | #{book.author}"
  end
end
