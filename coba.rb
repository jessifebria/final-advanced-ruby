require_relative "library"
require_relative "main"

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

a = Main.new
a.parse_command("aa")