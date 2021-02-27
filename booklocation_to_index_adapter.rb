class BookLocationToIndexAdapter
    
    def initialize(book_location)
        @book_location = book_location
    end

    def convert
        shelter_index = @book_location[0..1].to_i -1
        row_index = @book_location[2..3].to_i -1
        column_index = @book_location[4..5].to_i -1
        return shelter_index, row_index, column_index
    end
end