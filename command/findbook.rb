require_relative 'command'
require './library'
require './book'
require './index_to_booklocation_adapter'

class FindBook < Command

    def validate(params)
        if (params.length != 1) or (num?(params[0].to_s) == false) or params[0].to_i<1
            return "Invalid Value!"
        end
        @isbn = params[0]
        return "valid"
    end

    def execute(params)
        message = validate(params)
        if message != "valid"
            return message
        end

        library = Library.instance
        shelter_index, row_index, column_index = library.find_book(@isbn)
        # shelters = library.shelters

        # shelter_index = 0
        # row_index = 0
        # flag = 0
        # for shelter in shelters do
        #     for rows in shelter do
        #         row_index = 0
        #         column_index = 0
        #         for book in rows do
        #             if book != 0
        #                 if book.isbn == @isbn
        #                     flag = 1
        #                     break
        #                 end
        #             end
        #             column_index +=1 
        #         end
        #         if flag == 1
        #             break
        #         end
        #         row_index+=1
        #     end
        #     if flag == 1
        #         break
        #     end
        #     shelter_index+=1
        # end
        # if flag == 0 
        #     return "Book not found!"
        # end

        if shelter_index == -1 
            return "Book not found!"
        end

        adapter = IndexToBookLocationAdapter.new

        return "Found the book at #{adapter.convert(shelter_index, row_index, column_index)}"
    end
end