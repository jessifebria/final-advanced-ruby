class Command
    
    def validate(params)
        puts "Not Implemented yet"
    end

    def execute(params)
        puts "Not Implemented yet"
    end

    def num?(string)
        if string[0] == "-"
            string[1...string.length].scan(/\D/).empty?
        else
            string.scan(/\D/).empty?
        end
    end
end