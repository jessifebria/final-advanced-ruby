
class Library
    attr_accessor :shelters

    @shelters 
    @@instance = Library.new()

    def initialize(arr)
        @n = arr[0]
        @x = arr[1]
        @y = arr[2]
    end

    def self.createinstance(arr)
        if @n==nil or @x==nil or @y==nil
            @n = arr[0]
            @x = arr[1]
            @y = arr[2]
        end
    end

    def self.instance
        @@instance 
    end

    private_class_method :new

    

    def put_book(book)
        # puts "#{@shelters}"
        shelter_index = 0
        row_index = 0
        column_index = -1
        for shelter in shelters do
            # puts"NEW SHELTER"
            for rows in shelter do
                row_index = 0
                column_index = rows.index("0")
                if column_index.is_a?Integer 
                    flag = 1
                    @shelters[shelter_index][row_index][column_index] = book
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