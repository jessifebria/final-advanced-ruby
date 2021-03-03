require './app/gateway'

main = Gateway.new

while true
  user_input = gets.chomp
  break if user_input == 'end'

  puts main.input_command(user_input)
end
