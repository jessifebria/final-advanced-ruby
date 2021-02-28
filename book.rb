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
    
    def is_author_contains?(author_from_user)
        if author.include? author_from_user
            return true
        end
        false
    end
    
    def is_title_contains?(title_from_user)
        if title.include? title_from_user
            return true
        end
        false
    end

    
end