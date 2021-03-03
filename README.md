# My Library
Jessi Febria's final project submission for ElectivesxGoAcademy Ruby Advanced class. Solving the problem, along with SOLID principle, Design pattern : Factory, Singleton, Adapter, Command

# Problem Statement
Create simple catalogue for my books, I have limited room capacity and for now, and can only buy a limited number of bookshelves (n). I don’t know how big each shelf that I will buy, but all of them should have the same size of ‘x’ rows and can store ‘y’ books in a row. Since the budget is limited, so ‘n’, ‘x’, and ‘y’ will definitely be less than 100 each. <br/>

# Program Feature
List of feature in this program :
 <br/>
● Build Library <br/>
● Find the slot address of a first book with a given ISBN <br/>
● List of all books (ISBN, title, author) and their slot addresses <br/>
● Search the books by title keyword <br/>
● Search the books by author keyword <br/>

# Environment
Here is list of gems used : 
● Ruby 2.7.0p0 (as main language)  <br/>
● RSpec 3.10 (to do test)<br/>
● SimpleCov (to better UI in test)<br/>

# How To Run
Clone it first :
```
git clone https://github.com/jessifebria/final-advanced-ruby
```
Run test case :
```
bundle exec rspec -fd spec/
```
Run program :
```
ruby bin/main.rb
```

