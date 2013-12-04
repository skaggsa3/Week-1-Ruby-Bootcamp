#section 1 a

local_var = "i'm outside the scope"

puts local_var

2.times do 
  local_var = "I'm inside the scope of the block"
  puts local_var
end

puts local_var


#section 1 b
section_b_var = "I'M UPPERCASE"

puts section_b_var

2.times do
  puts section_b_var.downcase
end

puts section_b_var


#section 1 c 
section_b_var = "I'M UPPERCASE"

puts section_b_var

1.times do
  puts section_b_var.downcase!
end

puts section_b_var

#section 2 
1.times do 
  inside_scope_variable = "I'm the inside the do block"
  puts inside_scope_variable
end

puts inside_scope_variable #--> This will fail

#section 2 b 
1.times do 
  1.times do
    nested_var = "I'm nested"
    puts nested_var
  end
  puts nested_var #---> THIS WILL FAIL BECAUSE IT CAN'T SEE nested_var
end