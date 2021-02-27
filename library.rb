
class Library
    attr_accessor :shelters

    @@instance = nil

    def initialize(n,x,y)
        @n = n
        @x = x
        @y = y
        @shelters = createshelter
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

    def take_book(shelter_index, row_index, column_index)
        if @shelters[shelter_index][row_index][column_index] == "0"
            return "Slot #{shelter_index+1}. "
        end
    end


    private def createshelter
        Array.new(@n) {Array.new(@x) {Array.new(@y){"0"}}}
    end

end