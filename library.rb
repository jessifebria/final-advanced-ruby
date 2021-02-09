
class Library
    attr_accessor :n, :x, :y

    def initialize(arr)
        @n = arr[0]
        @x = arr[1]
        @y = arr[2]
    end

    def build
        message = "Shelf 1 with #{@x} rows and #{y} columns is added"
        for i in 2..n do
            message += "\nShelf #{i} with #{@x} rows and #{y} columns is added"
        end
        
        return message
    end
end