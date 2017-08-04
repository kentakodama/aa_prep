

book = {title: "The Bible", 
    author: "Jesus",
    release_date: 400,
    review: 5
}

puts book
# adding keys and values
book[:heros] = "GOD"

puts book[:heros]
puts book
puts book.size

#changing value of key
book[:author] = "Moses"
puts book
# deleting key value pairs

book.delete(:heros)
puts book

puts "Iterating over HASHES with EACH"

book = {title: "The Bible", 
    author: "Jesus",
    release_date: 400,
    review: 5
}
puts "only the keys"
book.each {|key, value| puts key}


puts "only the values"
book.each_value {|value| puts value}


puts "TEST CONDITIONALs Capitalize all letters in values"
book.each {|key, value| book[key] = value.upcase if value.is_a? String}


puts book

puts "EXAMPLE GRADES"
#NOTE: you cannot use "kenta" and :kenta interchangeably!!!
grades = Hash.new(0)
grades["kenta"] = 60
grades["elaine"] = 73
grades["keiko"] = 92
grades["toshio"] = 55
grades["mary"] = 88

puts "SELECT to filter Hashes"

passing_students = grades.select {|student, score| score >= 70}
puts passing_students

#. size method similar to length

puts "size method"
puts passing_students.size


puts "sort_by"
# IMPORTANT! If you sort a hash in any way, it will return an array of array
# Because Hashes inherently dont have an order
lowest_to_highest_grades = grades.sort_by {|student, score| score}

# this is an array
puts lowest_to_highest_grades

# this method converts the array to a hash
puts lowest_to_highest_grades.to_h


puts "Converting Hash Keys to an Array"
array_of_keys = []
book.each_key {|key| array_of_keys << key }
puts array_of_keys
puts array_of_keys.is_a? Array


# converting between hashes and arrays 
puts "Convertin sub arrays to Hashes and vice versa"
# use the sort method
# .to_a
# .to_h

puts "creating default values"
# two ways
# 1 Hash.new(0)
# 2 use the .default(0) method to an existing hash, all keys that dont have values set yet will have values set to default

puts "Creating a dictionary of letter counts for a single word"

letter_count = Hash.new(0)

string = "sentence"
letters = string.split("")
letters.each {|letter| letter_count[letter] += 1}

puts letter_count

puts "get letter count for mutiple words"

letter_count2 = Hash.new({}) #this is interesting
string = "Hello this is a super sentence"
words = string.split(" ")
words.each do |word| 
    letter_count2[word] = Hash.new(0)
    letters = word.split("")
    letters.each {|char| letter_count2[word][char] += 1}
end

puts letter_count2

#WHATTTTT I DID ITTTTTT!!!!!

#example 
puts letter_count2["Hello"]["l"]







