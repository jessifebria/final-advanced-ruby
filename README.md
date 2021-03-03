# My Library
Jessi Febria's final project submission for ElectivesxGoAcademy Ruby Advanced class. Solving the problem, along with SOLID principle, Design pattern : Factory, Singleton, Adapter, Command

# Problem Statement
Create simple catalogue for my books, I have limited room capacity and for now, and can only buy a limited number of bookshelves (n). I don’t know how big each shelf that I will buy, but all of them should have the same size of ‘x’ rows and can store ‘y’ books in a row. Since the budget is limited, so ‘n’, ‘x’, and ‘y’ will definitely be less than 100 each. <br/>

# Program Feature
List of feature in this program : <br/>
● Build Library <br/>
● Find the slot address of a first book with a given ISBN <br/>
● List of all books (ISBN, title, author) and their slot addresses <br/>
● Search the books by title keyword <br/>
● Search the books by author keyword <br/>

# Environment
Here is list of gems used :  <br/>
● Ruby 2.7.0p0 (as main language)  <br/>
● RSpec 3.10 (to do test)<br/>
● SimpleCov (to better UI in test)<br/>

# How To Run
Clone it first :
```ruby
git clone https://github.com/jessifebria/final-advanced-ruby
```
Run test case :
```ruby
bundle exec rspec -fd spec/
```
Run program :
```ruby
ruby bin/main.rb
```

# Sample of Test Case
```ruby
build_library|2|1|3
Shelf 1 with 1 rows and 3 columns is added
Shelf 2 with 1 rows and 3 columns is added
put_book|9780747532743|Harry Potter 1|J. K. Rowling
Allocated address: 010101
put_book|9780807281918|Harry Potter 2|J. K. Rowling
Allocated address: 010102
put_book|9780739330944|Eragon 1|Christopher Paolini
Allocated address: 010103
put_book|9780545582933|Harry Potter 3|J. K. Rowling
Allocated address: 020101
put_book|9780132350884|Clean Code|Robert Cecil Martin
Allocated address: 020102
put_book|9780201485677|Refactoring|Martin Fowler, Kent Beck
Allocated address: 020103
take_book_from|020102
Slot 020102 is free
take_book_from|010102
Slot 010102 is free
put_book|9780132350884|Clean Code|Robert Cecil Martin
Allocated address: 010102
put_book|9780807281918|Harry Potter 2|J. K. Rowling
Allocated address: 020102
put_book|9780321146533|TDD: By Example|Kent Beck
All shelves are full!
take_book_from|999999
You exceed limit capacity!
find_book|9780807281918
Found the book at 020102
find_book|000
Invalid Value!
list_books
010101 : 9780747532743 | Harry Potter 1 | J. K. Rowling
010201 : 9780132350884 | Clean Code | Robert Cecil Martin
010301 : 9780739330944 | Eragon 1 | Christopher Paolini
020101 : 9780545582933 | Harry Potter 3 | J. K. Rowling
020201 : 9780807281918 | Harry Potter 2 | J. K. Rowling
020301 : 9780201485677 | Refactoring | Martin Fowler, Kent Beck
search_books_by_title|Harry Potter
010101 : 9780747532743 | Harry Potter 1 | J. K. Rowling
020101 : 9780545582933 | Harry Potter 3 | J. K. Rowling
020201 : 9780807281918 | Harry Potter 2 | J. K. Rowling
search_books_by_author|Kent Beck
020301 : 9780201485677 | Refactoring | Martin Fowler, Kent Beck
search_books_by_author|Tolkien
Book not found!
abc            
Invalid Command!
end
```ruby



