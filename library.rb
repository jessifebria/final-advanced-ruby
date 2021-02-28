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
        for shelter_index in 0...@shelters.length do
            for row_index in 0...@shelters[shelter_index].length do
                column_index = @shelters[shelter_index][row_index].index(0)
                if column_index.is_a?Integer 
                    @shelters[shelter_index][row_index][column_index] = book
                    return shelter_index, row_index, column_index
                end
            end
        end
        return -1,-1,-1
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