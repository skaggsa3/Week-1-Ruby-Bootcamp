require 'pry'

while true
  puts "Whats the first number? "
  num1 = gets.chomp

  puts "Whats the second number?"
  num2 = gets.chomp

  puts "1) add 2) subtract 3)mulitply 4)divide"
  answer = gets.chomp

  #binding.pry

  case answer
  when "1"
    result = num1.to_i + num2.to_i
  when "2"
    result = num1.to_i - num2.to_i
  when "3"
    result = num1.to_i * num2.to_i
  when "4"
    result = num1.to_f / num2.to_f
  else
    puts "Please enter a valid selection"
  end

  puts "The result is #{result}"

  puts "Would you like to continue? yes/no"
  continue = gets.chomp.downcase

  if continue == "yes"
    next
  else
    puts "Thanks! Come again!"
    break
  end
end
