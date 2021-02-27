
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

end