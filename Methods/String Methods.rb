
puts "hello".include?("o")
puts "This is a string".gsub("s", "th")

puts "Hello".reverse

puts "hello".index("o")
puts "hello".index("l")

string = "hello"

# start index, for n elements
puts string.slice(0, 2)

# original unchanged
puts string

# setting a range is also ok 
puts string.slice(1..-1)

# last element
puts string.slice(-1)

greeting = "ohayho"
puts greeting.chop
puts greeting
