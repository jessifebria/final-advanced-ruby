require_relative 'command'
require './app/library'
require './app/book'
require './app/adapter/booklocation_to_index_adapter'

class TakeBook < Command
  def validate(params)
    if (params.length != 1) || (num?(params[0].to_s) == false) || (params[0].to_s.length != 6) || (params[0].to_i < 1)
      return 'Invalid Value!'
    end

    @book_location = params[0].to_s

    adapter = BookLocationToIndexAdapter.new
    @shelter_index, @row_index, @column_index = adapter.convert(@book_location)

    @library = Library.instance

    return 'You exceed limit capacity!' if @library.is_index_exceed?(@shelter_index, @row_index, @column_index)

    'valid'
  end

  def execute(params)
    message = validate(params)
    return message if message != 'valid'

    # puts "LIBRARY ", @library
    status = @library.take_book(@shelter_index, @row_index, @column_index)
    return "Slot #{@book_location} is free" if status

    "Slot #{@book_location} is empty from the start!"
  end
end
