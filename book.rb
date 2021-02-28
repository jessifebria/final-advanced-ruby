class Book
    attr_accessor :isbn, :title, :author
    def initialize(isbn, title, author)
        @isbn = isbn
        @title = title
        @author = author
    end

    def is_isbn_same?(isbn_from_user)
        if isbn == isbn_from_user
            return true
        end
        false
    end

    
end