class Book
    attr_accessor :isbn, :title, :author
    def initialize(isbn, title, author)
        @isbn = isbn
        @title = title
        @author = author
    end
end