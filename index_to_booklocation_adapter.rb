class IndexToBookLocationAdapter

    def convert(shelter_index, row_index, column_index)
        book_location = "#{(shelter_index+1).to_s.rjust(2, "0")}#{(row_index+1).to_s.rjust(2, "0")}#{(column_index+1).to_s.rjust(2, "0")}"
        return book_location
    end
end