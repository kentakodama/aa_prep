arr = [1, 2, 3, 4, 5]

# each
arr.each {|element| puts element * 3}


doubled_arr = []
arr.each {|num| doubled_arr << num*2}
puts doubled_arr

puts "Only Even elements with EACH METHOD"

even_arr = []
arr.each {|num| even_arr << num if num.even?}
puts even_arr

# nested each iterator
puts "NESTED EACH ITERATOR METHOD"
ingredients = [["ham", "cheese"], ["beef", "cheese", "peppers"]]

ingredients.each { |sandwich| sandwich.each {|inside| puts inside}}

# map method
puts "Map Method"
tripled_arr = arr.map {|element| element * 3}
puts tripled_arr
# this also the same
arr.map! {|element| element * 3}
puts arr
# reduce
sum = arr.reduce(:+)
puts sum

product = arr.reduce(:*)
puts product

arr = ["hello", "bye"]
phrase = arr.reduce(:+)
puts phrase


# Select Method
puts "Select Method"
arr = [40, 2, 90, 12, 125, 43, 5]

over_forty = []
over_forty = arr.select {|num| num > 40}

puts arr
puts "filtered"
puts over_forty

# include? method
puts "INCLUDE? Method"
arr = [1, 2, 3, 4, 5]
puts arr.include?(4)
puts arr.include?(6)

# Max method, gets highest element from array
puts "MAX METHOD"
numbers = [2, 5, 55, 3, 44]

puts "INDEX METHOD"

puts numbers.index(numbers.max)

#first/last method DOESNT Change the original array
puts numbers.last


#sorting arrays
puts "Sorting ascending"
puts "unsorted"
unsorted = [2, 4, 22, 3, 8, 18, 94, 43, 87, 12]
puts unsorted
puts "sorted"
sorted = unsorted.sort 
puts sorted

#longer way
sort2 = unsorted.sort {|a, b| a <=> b}
puts sort2

# descending
puts "Descending order"
sort3 = unsorted.sort {|a, b| b <=> a}
puts sort3

#sorting by word length
puts "Sorting by word length"
words = ["helloooo", "david", "nice", "go"]
sorted_by_length = words.sort {|word| word.length}
puts sorted_by_length
puts sorted_by_length[-1]





