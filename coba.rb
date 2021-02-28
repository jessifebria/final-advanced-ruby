require_relative "library"
require_relative "main"
require './command/build'

# $library

# def aa
#   $library = Library.new([1,2,3])
#   puts "#{$library}"
# end

# aa
# puts "#{$library}"

# x = 3
# y =4
# bb= Array.new(x) {Array.new(y){"0"}}
# puts "#{bb}"

# build = input_command("build_library|2|1|3")
# response = input_command("put_book|9780747532743|Harry Potter 1|J. K. Rowling")

# a = ["0","0","0"]
# b= a.index("1")
# puts(b==nil)

# for i in 1..4 do
#   puts("bb")
#   for j in 1..3 do
#     if j==1
#       puts("aa")
#       a=1
#       break
#     end
#   end
#   if a==1 
#     puts("out")
#     break
#   end
# end

# c= [[["0", "2", "0"]], [["0", "0", "0"]]]
# puts(c[0][0][1])

# puts(3.is_a?Integer)

# a = Main.new
# a.parse_command("aa")


d = Library.createinstance([1,2,3])

puts d

e = Library.instance

puts e

f = Library.instance

puts f

d = Library.createinstance([4,5,3])

puts d

e = Library.instance

puts e

f = Library.instance

puts f

# puts f.shelters

# g = Library.new(2,1,3)

a = "012234"

c = a[0..1].to_i

puts c

d = "123"

e, f = d.split("|")

puts "f", f, "c"

if f==nil
    puts "aa"
end

d = Hash.new
d["a"] ="1"
d["c"]= "2"

for i in d.keys
    puts i, d[i]
end
commands_from_user="takebook"

array_of_commands = commands_from_user.split("|")
command = array_of_commands[0]
params = array_of_commands.slice(1,array_of_commands.length)


if params.length == 0
    puts "aa"
end

a = Hash.new

if a.keys.length == 0
    puts "bb"
end

if a.empty?
    puts "cc"
end