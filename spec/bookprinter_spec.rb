require '../advanced_final/app/printer_factory/bookprinter'
require '../advanced_final/app/book'

describe 'Book Printer' do
  it 'return book' do
    book = Book.new('1293102', 'Hello World', 'ABC')
    bookprinter = BookPrinter.new
    expect(bookprinter.print(book)).to eq('1293102 | Hello World | ABC')
  end
end
