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

build = input_command("build_library|2|1|3")
response = input_command("put_book|9780747532743|Harry Potter 1|J. K. Rowling")
