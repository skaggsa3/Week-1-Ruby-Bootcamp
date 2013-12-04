#section a

local_var = "i'm outside the scope"

puts local_var

2.times do 
	local_var = "I'm inside the scope of the block"
	puts local_var
end

puts local_var


#section b
section_b_var = "I'M UPPERCASE"

puts section_b_var

2.times do
	puts section_b_var.downcase
end

puts section_b_var


#section c 
section_b_var = "I'M UPPERCASE"

puts section_b_var

1.times do
	puts section_b_var.downcase!
end

puts section_b_var