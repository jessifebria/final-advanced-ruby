require_relative 'index_to_booklocation_adapter'
require_relative 'book'

class Library
    attr_accessor :shelters

    @@instance = nil

    def initialize(n,x,y)
        @n = n
        @x = x
        @y = y
        @shelters = createshelter
        @ToBookLocationAdapter = IndexToBookLocationAdapter.new
    end

    def self.reset
        @@instance = nil
        public_class_method :new
    end

    def self.createinstance(arr)
        if @@instance == nil
            @@instance = Library.new(arr[0], arr[1], arr[2])
            private_class_method :new
        end
    end

    def self.instance
        @@instance 
    end

    def put_book(book)
        # puts "BEFORE SHELTERS", @shelters
        shelter_index = 0
        row_index = 0
        flag = 0
        for shelter in @shelters do
            for rows in shelter do
                row_index = 0
                column_index = rows.index(0)
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
        if flag == 0 
            return -1,-1,-1
        end
        # puts "SHELTERS", @shelters
        return shelter_index, row_index, column_index
    end

    def take_book(shelter_index, row_index, column_index)
        if @shelters[shelter_index][row_index][column_index] == 0
            return false
        end
        @shelters[shelter_index][row_index][column_index] = 0
        return true
    end
    
    def find_book(isbn_from_user)
        for shelter_index in 0...@shelters.length do
            for row_index in 0...@shelters[shelter_index].length do
                for column_index in 0...@shelters[shelter_index][row_index].length do
                    book = @shelters[shelter_index][row_index][column_index]
                    if book != 0
                        if book.is_isbn_same?(isbn_from_user)
                            return shelter_index, row_index, column_index
                        end
                    end
                end
            end
        end
        
        return -1,-1,-1
    end


    def is_index_exceed?(shelter_index, row_index, column_index)
        if (shelter_index >= @n) or (row_index >= @x) or (column_index >= @y)
            return true
        end
        return false
    end

    private def createshelter
        Array.new(@n) {Array.new(@x) {Array.new(@y){0}}}
    end

end