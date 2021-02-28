
require './library'
require './book'
require './index_to_booklocation_adapter'

class ListBooks

    def execute
        adapter = IndexToBookLocationAdapter.new
        response = ""
        library = Library.instance
        shelters = library.shelters
        shelter_index = 0
        row_index = 0
        flag = 0
        for shelter in shelters do
            for rows in shelter do
                row_index = 0
                column_index = 0
                for book in rows do
                    if book != 0
                        response += "#{adapter.convert(shelter_index,column_index, row_index)} : #{book.print_detail}\n"
                        column_index +=1 
                    end
                end
                if flag == 1
                    break
                end
                row_index+=1
            end
            if flag == 1
                break
            end
            shelter_index+=1
        end


        return response
    end
end