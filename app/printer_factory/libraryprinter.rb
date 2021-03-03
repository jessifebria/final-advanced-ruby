require_relative 'printer'
require '../advanced_final/app/book'
require_relative 'printerfactory'

class LibraryPrinter < Printer
  def print(hash_of_books)
    response = ''
    bookprinter = PrinterFactory.new_printer('book')
    hash_of_books.keys.each do |book_location|
      response += "#{book_location} : #{bookprinter.print(hash_of_books[book_location])}\n"
    end
    response
  end
end
