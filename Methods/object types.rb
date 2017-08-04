# converting between different objects

# from array to hash!!!! 
  
menu = {"hot dog": 4,
    "hamburger": 7
}

arr_of_arr = menu.to_a
puts arr_of_arr

puts arr_of_arr.to_h


# checking if a varialble is really the type of object you think it is

is_a? String
is_a? Numeric
is_a? Array 
is_a? Hash
# get object class


arr = [1, 2, 3]
puts arr.class
