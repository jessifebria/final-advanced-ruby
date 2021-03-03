require '../final-advanced-ruby/app/library'

class SearchBooks
  def initialize(type)
    @type = type
  end

  def validate(params)
    return 'Invalid Value!' if params.length != 1

    @keyword = params[0]
    'valid'
  end

  def execute(params)
    message = validate(params)
    return message if message != 'valid'

    library = Library.instance
    hash_of_books = library.searchbooks(@type, @keyword)

    return 'Book not found!' if hash_of_books.empty?

    printer = PrinterFactory.new_printer('library')
    printer.print(hash_of_books)
  end
end
