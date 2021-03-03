require_relative 'command'
require './app/library'
require './app/book'
require './app/adapter/index_to_booklocation_adapter'

class FindBook < Command
  def validate(params)
    return 'Invalid Value!' if (params.length != 1) || (num?(params[0].to_s) == false) || (params[0].to_i < 1)

    @isbn = params[0]
    'valid'
  end

  def execute(params)
    message = validate(params)
    return message if message != 'valid'

    library = Library.instance
    shelter_index, row_index, column_index = library.find_book(@isbn)

    return 'Book not found!' if shelter_index == -1

    adapter = IndexToBookLocationAdapter.new

    "Found the book at #{adapter.convert(shelter_index, row_index, column_index)}"
  end
end
