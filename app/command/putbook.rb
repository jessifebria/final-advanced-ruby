require_relative 'command'
require './app/library'
require './app/book'
require './app/adapter/index_to_booklocation_adapter'

class PutBook < Command
  def validate(params)
    return 'Invalid Value!' if params.length != 3

    @isbn = params[0]
    @title = params[1]
    @author = params[2]
    return 'Invalid Value!' if !num?(@isbn) || num?(@author)

    'valid'
  end

  def execute(params)
    message = validate(params)
    return message if message != 'valid'

    book = Book.new(@isbn, @title, @author)
    library = Library.instance
    shelter_index, row_index, column_index = library.put_book(book)
    return 'All shelves are full!' if shelter_index == -1

    # puts "LIBRARY ", library
    adapter = IndexToBookLocationAdapter.new

    "Allocated address: #{adapter.convert(shelter_index, row_index, column_index)}"
  end
end
