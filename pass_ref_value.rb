#---> This is to test passing by reference vs by value

arr = [1, 2, 3, 4, 5]

def pass_by(arr)
  #arr.reverse --> This will not mutate the array method and is evidenced by the puts arr at the end of the method. 
  arr.reverse! #-->  This will mutate the caller as evidenced by the the puts call's
  puts arr
end

pass_by(arr)
puts ""
puts arr