require '../advanced_final/app/library'
require '../advanced_final/app/book'
require '../advanced_final/app/adapter/index_to_booklocation_adapter'
require '../advanced_final/app/printer_factory/printerfactory'

class ListBooks
  def execute
    library = Library.instance
    hash_of_books = library.get_hash_of_books
    printer = PrinterFactory.new_printer('library')
    printer.print(hash_of_books)
  end
end
