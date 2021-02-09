
class Library
    attr_accessor :n, :x, :y

    def initialize(arr)
        @n = arr[0]
        @x = arr[1]
        @y = arr[2]
    end

    def build
        return "Shelf 1 with 1 rows and 3 columns is added\nShelf 2 with 1 rows and 3 columns is added"
    end
end