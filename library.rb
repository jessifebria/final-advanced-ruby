
class Library
    attr_accessor :n, :x, :y, :books

    @books 

    def initialize(arr)
        @n = arr[0]
        @x = arr[1]
        @y = arr[2]
    end

    def build
        @books = Array.new(n) {Array.new(x) {Array.new(y){"0"}}}
        # puts "#{@books}, #{x}, #{y}"
        message = "Shelf 1 with #{@x} rows and #{y} columns is added"
        for i in 2..n do
            message += "\nShelf #{i} with #{@x} rows and #{y} columns is added"
        end
        return message
    end

    def put_book(book)
        puts "#{@books}"
        return "Allocated address: 010101"
    end
end