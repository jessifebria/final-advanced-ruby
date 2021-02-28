require './printer/bookprinter'
require './book'

describe "Book Printer" do
    
    it "return book" do
        book = Book.new("1293102", "Hello World", "ABC")
        bookprinter = BookPrinter.new(book)
        expect(bookprinter.print).to eq("1293102 | Hello World | ABC")
    end

end