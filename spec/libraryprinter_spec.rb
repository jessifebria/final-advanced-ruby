require '../advanced_final/app/printer_factory/libraryprinter'
require '../advanced_final/app/book'

describe 'Library Printer' do
  it 'return list of books with its location' do
    book = Book.new('1293102', 'Hello World', 'ABC')
    hash_of_books = {}
    hash_of_books['123451'] = book
    hash_of_books['709915'] = book
    libraryprinter = LibraryPrinter.new
    expect(libraryprinter.print(hash_of_books)).to eq("123451 : 1293102 | Hello World | ABC\n709915 : 1293102 | Hello World | ABC\n")
  end
end
