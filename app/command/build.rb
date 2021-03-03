require_relative 'command'
require './app/library'

class Build < Command
  def validate
    return 'Invalid Value!' if @params.length != 3

    @params.each do |param|
      if !num?(param)
        return 'Invalid Value, It must be an integer!'
      elsif param.to_i < 1
        return 'No Shelf added'
      elsif param.to_i > 99
        return 'You exceed limit capacity!'
      end
    end
    @params = @params.map(&:to_i)
    @n = @params[0]
    @x = @params[1]
    @y = @params[2]
    'valid'
  end

  def execute(params)
    @params = params
    message = validate
    return message if message != 'valid'

    Library.createinstance([@n, @x, @y])

    printresult
  end

  def printresult
    message = "Shelf 1 with #{@x} rows and #{@y} columns is added"
    (2..@n).each do |i|
      message += "\nShelf #{i} with #{@x} rows and #{@y} columns is added"
    end
    message
  end
end
