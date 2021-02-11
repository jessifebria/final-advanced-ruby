
class Library
    attr_accessor :n, :x, :y, :shelters

    @shelters 

    def initialize(arr)
        @n = arr[0]
        @x = arr[1]
        @y = arr[2]
    end

    def build
        @shelters = Array.new(n) {Array.new(x) {Array.new(y){"0"}}}
        # puts "#{@shelters}, #{x}, #{y}"
        message = "Shelf 1 with #{@x} rows and #{y} columns is added"
        for i in 2..n do
            message += "\nShelf #{i} with #{@x} rows and #{y} columns is added"
        end
        return message
    end

    def put_book(book)
        puts "#{@shelters}"
        shelter_index = 0
        row_index = 0
        column_index = -1
        for shelter in shelters do
            for rows in shelter do
                column_index = rows.index("0")
                if column_index != nil 
                    flag = 1
                    @shelters[shelter_index][row_index][column_index] = "aa"
                    break
                end
                row_index+=1
            end
            if flag == 1
                break
            end
            shelter_index+=1
        end
        
        return "Allocated address: #{(shelter_index+1).to_s.rjust(2, "0")}#{(row_index+1).to_s.rjust(2, "0")}#{(column_index+1).to_s.rjust(2, "0")}"
    end
end