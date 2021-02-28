require './printer/libraryprinter'
require './book'

describe "Library Printer" do
    
    it "return list of books with its location" do
        book = Book.new("1293102", "Hello World", "ABC")
        hash_of_books = Hash.new
        hash_of_books["123451"] = book
        hash_of_books["709915"] = book
        libraryprinter = LibraryPrinter.new(hash_of_books)
        expect(libraryprinter.print).to eq("123451 : 1293102 | Hello World | ABC\n709915 : 1293102 | Hello World | ABC\n")
    end

end