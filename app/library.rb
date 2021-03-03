require_relative 'adapter/index_to_booklocation_adapter'
require_relative 'book'

class Library
  attr_accessor :shelters

  @@instance = nil

  def initialize(n, x, y)
    @n = n
    @x = x
    @y = y
    @shelters = createshelter
    @ToBookLocationAdapter = IndexToBookLocationAdapter.new
  end

  def self.reset
    @@instance = nil
    public_class_method :new
  end

  def self.createinstance(arr)
    if @@instance.nil?
      @@instance = Library.new(arr[0], arr[1], arr[2])
      private_class_method :new
    end
  end

  def self.instance
    @@instance
  end

  def put_book(book)
    (0...@shelters.length).each do |shelter_index|
      (0...@shelters[shelter_index].length).each do |row_index|
        column_index = @shelters[shelter_index][row_index].index(0)
        if column_index.is_a? Integer
          @shelters[shelter_index][row_index][column_index] = book
          return shelter_index, row_index, column_index
        end
      end
    end
    [-1, -1, -1]
  end

  def take_book(shelter_index, row_index, column_index)
    return false if @shelters[shelter_index][row_index][column_index] == 0

    @shelters[shelter_index][row_index][column_index] = 0
    true
  end

  def find_book(isbn_from_user)
    (0...@shelters.length).each do |shelter_index|
      (0...@shelters[shelter_index].length).each do |row_index|
        (0...@shelters[shelter_index][row_index].length).each do |column_index|
          book = @shelters[shelter_index][row_index][column_index]
          next unless book != 0
          return shelter_index, row_index, column_index if book.is_isbn_same?(isbn_from_user)
        end
      end
    end
    [-1, -1, -1]
  end

  def get_hash_of_books
    response = ''
    hash_of_books = {}
    (0...@shelters.length).each do |shelter_index|
      (0...@shelters[shelter_index].length).each do |row_index|
        (0...@shelters[shelter_index][row_index].length).each do |column_index|
          book = @shelters[shelter_index][row_index][column_index]
          if book != 0
            book_location = @ToBookLocationAdapter.convert(shelter_index, column_index, row_index)
            hash_of_books[book_location] = book
          end
        end
      end
    end
    hash_of_books
  end

  def searchbooks(type, keyword)
    response = ''
    hash_of_books = {}
    (0...@shelters.length).each do |shelter_index|
      (0...@shelters[shelter_index].length).each do |row_index|
        (0...@shelters[shelter_index][row_index].length).each do |column_index|
          book = @shelters[shelter_index][row_index][column_index]
          next unless book != 0

          if ((type == 'author') && book.is_author_contains?(keyword)) || ((type == 'title') && book.is_title_contains?(keyword))
            book_location = @ToBookLocationAdapter.convert(shelter_index, column_index, row_index)
            hash_of_books[book_location] = book
          end
        end
      end
    end
    hash_of_books
  end

  def is_index_exceed?(shelter_index, row_index, column_index)
    return true if (shelter_index >= @n) || (row_index >= @x) || (column_index >= @y)

    false
  end

  private

  def createshelter
    Array.new(@n) { Array.new(@x) { Array.new(@y) { 0 } } }
  end
end
