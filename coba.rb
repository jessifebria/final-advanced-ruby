class Dog
    attr_accessor :name, :age
    def initialize(name,age)
        @name = name
        @age = age
    end
    
    def bark
        puts "#{name}" +"says woof!"
        self.name = "cc"
    end
    def move(place)
        puts @name +"go to #{place}"
    end
end

class Cat
    def initialize(name,age)
        @name = name
        @age = age
    end
    def name
        return @name
    end
    def age
        return @age
    end
    def age=(value)
        @age = value
    end
    def meow
        puts @name +"says meow!"
    end
    def move(place)
        puts @name +"go to #{place}"
    end
end

# my_dog = Dog.new("Doja", 1)
# my_cat = Cat.new("Owen", 2)
# my_dog.age = 2
# puts "#{my_dog.name} is #{my_dog.age} years old"
# puts "#{my_cat.name} is #{my_cat.age} years old"
# my_dog.bark
# my_cat.meow
# my_dog.move("kitchen")
# my_cat.move("street")

# class Player
#     @@total = 0
#     def initialize(name)
#         puts "Player #{name} entered the game"
#         @name = name
#         @@total += 1
#     end
   
#     def self.total
#         @@total
#     end

#     def total
#         @@total
#     end
# end
#    player_one = Player.new("Joey")
#    player_two = Player.new("Chandler")
#    player_three = Player.new("Ross")

#    puts "Now we have #{Player.total} players"
#    puts "Now we have #{player_one.total} players"

# $name_of_game = "Friends Trivia"

# class Player
#     $name_of_game = "aaaaaaa"
#  def initialize()
#  puts "Player entered the #{$name_of_game} game"
#  end
# end

# class Animal
#  def initialize()
#  puts "Animal entered the #{$name_of_game} game"
#  end
# end
# player_one = Player.new()
# animal_one = Animal.new()


# class Passbook
#     attr_accessor :balance, :items, :total_spent

#     def initialize(balance)
#         @balance = balance
#         @items = Array.new
#         @total_spent = 0
#     end

#     def additem(item, price)
#         @items.push(item.downcase)
#         @balance -= price
#     end

# end

# print "Input current balance : "
# start_balance = gets.chomp.to_i
# passbook = Passbook.new(start_balance)
# puts "Input shopping list : "

# while true do
#     ans = gets.chomp.to_s
#     if ans== "EOD"
#         break
#     end
#     ans_split = ans.split(" ")
#     passbook.additem(ans_split[0], ans_split[1].to_i)
# end

# print "Items : #{passbook.items.join(",")}"
# puts ""
# puts "Total spent : #{start_balance - passbook.balance}"
# puts "Remaining balance : #{passbook.balance}"

# class GF
#     def initialize
#      puts 'In GF class'
#     end
#     def gfmethod
#      puts 'GF method call'
#     end
# end 
# class F < GF
#     def initialize
#      puts 'In F class'
#     end
# end 
# class S < F
#     def initialize
#      puts 'In S class'
#     end
# end

# son = S.new
# son.gfmethod
# father = F.new

# class Dog
#  def initialize(breed)
#  @breed = breed
#  puts "super called"
#  end
# end

# class Lab < Dog
#  def initialize(breed, name)
#  super(breed)
#  @name = name
#  end

#  def to_s
#  "(#@breed, #@name)"
#  end
# end

# puts Lab.new("Labrador", "Benzy").to_s

module WarmUp
    def push_ups
      "Phew, I need a break!"
    end
  end
  
  class Gym
    include WarmUp
    def push_ups
        "Phew, different!"
      end
    def preacher_curls
      "I'm building my biceps."
    end
  end
  
  class Dojo
    include WarmUp
    
    def tai_kyo_kyu
      "Look at my stance!"
    end
  end


  class Item
    attr_accessor  :id, :categories
    def initialize(id,  categories)
        @id= id
        @categories = categories
    end

    def test 
      a= self.categories
      for value in a do
        puts "#"
        puts value
        puts "----"
      end
    end

    def test2 
      puts self.categories[3]
      for value in 0..2 do
        puts "#{value}"
        puts self.categories[value]
        puts "----"
      end
    end


  end

a = ["bbb", "aaa", "ccc"]

item = Item.new('5', a)

categories= item.categories
puts "------------------"
puts item.test
puts "------------------"
puts item.test2
puts "------------------"
for value in categories do
  puts value
end

require_relative '../jessi/gofood/models/category'

get_category_byid('F003')
# cobacoba()

params = ['aa']

puts "PARAMS"
puts params.join(" or category_id = ")

a = 23
b= a.to_f/5
puts b
puts (a.to_f/5).ceil()

c= [1,2,3,4,5,6]
puts c[2..7]

c.push(nil)
c.push(7)
puts c


class Coba
  
  def self.test
    "aa"
  end

  def self.lagi
    self.test
  end

end

puts Coba.lagi

d = "abcde"

puts d.length

e = ["aa","bb","cc"]
f = e.join("</a#{d}> , <aaa>")
puts '<aaa>' +f + '</aaa>'