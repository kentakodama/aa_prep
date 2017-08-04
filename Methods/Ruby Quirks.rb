p "sort does NOT work on strings"
#"hello".sort # DOES NOT WORK
"hello".split("").sort.join("") #this works

##############
p ["a", "b"] == ["a", "b"] # is true
p ["a", "b"] == ["b", "a"] # is false
p ["a", "b"].sort == ["b", "a"].sort # is true because order matters
###############
# overlap boolean
p "check which elements overlap"
a = [1, 2, 3, 4]
b = [4, 5, 6, 2]

p (a & b)# => [2, 4], there is overlap
p "check if arr1 contains all elements of arr2"

arr1 = [1, 2, 3, 4]
arr2 = [1, 2]

p (arr1&arr2).sort == arr2.sort #easy peasy true ONLY IF UNIQUE items

#check if something is a permutation of another string


a = "hello"
b = "olelh"

a.split("").sort == b.split("").sort

##########
##### all method
def inAllStrings(arr, substring)
    arr.all? {|el| el.include?(substring)}
end

#################################

'string'.slice(0..3) #this works
'strings'.slice(1..-2)

"The world divides into facts.".chars

arr = [1, 2, 3, 4, 5]
arr[2, 3] #can act like slice => [3, 4, 5]

a, b = [1, 2]
a #=> 1
b #=> 2

["deliver us from", nil, "pues", nil].compact #=> ["deliver us from", "pues"]




###################
p ".empyty?/.any?"

arr = []
arr.empty?# true
arr.any? # false is there anything inside there array?
#####################
p "flatten array method"
p [1, 2, 3, [4]].flatten #[1, 2, 3, 4]
# gets all elements in one level array
######################


#short cut for most common
def most_common(string)
    count = Hash.new(0)
    string.split("").each { |letter| count[letter] += 1 }
    count.max_by{ |key,value| value }[0]
end

###############
(0..4).each do
      puts "hello"
end

5.times {puts "hello"}


#pop return popped element, and changes arr
arr = [1, 2, 3]
p arr.pop # 3
p arr # [1, 2]


#separating integers that are in string form from other char

def integer?(char)
    if char.to_i.to_s == char
        return true
    else
        return false
    end
end

p "how to get only the letters"
alphabet = ("a".."z").to_a
  #get rid of spaces
chars = string.split("")
letters = chars.select do |char|
    alphabet.include?(char.downcase)
end
  p letters

p "pushing quirks"

# push can only add one element at a time.
#SO if you push an array onto an array, it will create a subarray
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

results = []

until arr.empty?
  results << arr.shift(3)
end

results # [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
#if it cant be divided evenly [1, 2, 3], [4, 5, 6], [7]]




#deleting character of string or element of array NOT AT START OF END
p "use slice"

word = "hello"
p word.slice(1, 1)
p word
word.slice!(1, 1)
p word #"hllo"

name = ["Kenta", "Nicholas", "Kodama"]
p name
p name.slice(1, 1)
p name
name.slice!(1, 1) # this removes element in the middle
p name # only ["Kenta", "Kodama"] remain

p "12:30pm".delete!("pm") # "12:30"
p "pm12:30pm".delete!("pm") # "12:30" also works for multiple
arr = [1, 2, 3]
arr.delete(2) #value NOT index
p arr # [1, 3]

#slice! deletes at index
#delete deletes element value

# return statement conditional
# must explicitly state return
def big?(num)
    return true if num > 100
    return false if num <= 100
end

p big?(50)


#capitalize the first letter of the element with bang

array = ["hello", "bye"]
array.first.capitalize!
puts array.inspect

#modulus
p 3 % 4 # returns 3

# default Parameter
def greeting(who = nil)
    if who
        "Hello, #{who}!"
    else
        "Hello!"
    end
end

p greeting("kenta")

def default_100(name, age=100)
    p "#{name} is #{age} years old"
end

p default_100("kenta")

#get start index of substring
p "hello".index("el")

# Ways to get the first or last index for string
p "super"[0]
p "super".slice(0, 1)

p "hello"[-1]
p "hello".slice(-1, 1)

# two ways to get first or last index if array

p ["nice", "hair"].first
p ["nice", "hair"][0]

p ["nice", "hair"].last
p ["nice", "hair"][-1]

#Be careful for fdiv()
p (2/3).fdiv(1) # equals zero because 2 divided by 3 is 0

#get unique elements two ways
unique = arr.uniq

#or
unique = []
arr.each {|num| unique << num if !(unique.include? num)}
###########################

#multiple arguments undefined set, SPLAT argument
# can take all arguments and convert to array

def multiply(*args) # multiple arguments
    array = args.to_a #convert to array
    array.reduce(:*)
end

#create range 1 to n
def create_range(num)
    (1..num).to_a
end

p create_range(5)
#using range
def factorial(num)
    (1..num).reduce(:*)
end

p factorial(8)
###############################
# repeat action
def repeat(string, num=2)
    phrase = ""
    num.times {phrase += "#{string} "}
    phrase.chop
end


#include? uses

p "string".include? "t" # true
p [2, 3, 4].include? 3 # true
# include only checks keys NOT VALUES
my_hash = {"name" => "kenta"}
p my_hash.include? "name" #true
p my_hash.include? "kenta" #false

# must loop through to check if there is a value
p "iterate through hash with each"
my_hash = {"name" => "Kenta", "job" => "coder", "company" => "self-employed"}



######
#merge method for hash
p "Merge Method"
# adds a second hash to first, second overrides the first
h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }
h1.merge(h2)   #=> {"a"=>100, "b"=>254, "c"=>300}


#first overrides second
h1.merge(h2){|key, oldval, newval| newval - oldval}
               #=> {"a"=>100, "b"=>54,  "c"=>300}
h1             #=> {"a"=>100, "b"=>200}

#.keys method for a hash
# returns array of keys only, no need for sort
array_of_keys = my_hash.keys
array_of_values = my_hash.values
my_hash = {"name" => "Kenta", "job" => "coder", "company" => "self-employed"}
p my_hash.values.include? "Kenta" #true
p my_hash.values.include? "Ken" #false

# return a filtered hash, interesting way to return key value pair

my_hash = {"name" => "Kenta", "job" => "coder", "company" => "self-employed"}
p my_hash.select {|k, v| k == "name"}

# return a filtered hash if it includes a substring
my_hash = {"name" => "Kenta", "job" => "coder", "company" => "self-employed"}
def find(hash, substring)
    hash.select {|k, v| k.include? substring}
end

p find(my_hash, "company")

#################
p "Access more keys and values"
animals = {cat: 2, fox: 6, whale: 4}

animals.values.min # 2
animals.values.max #6
p animals.max_by {|type, num| num} # ["fox", 6]




##################
#looping with each and while both with indexes

arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
arr3 = [1, 2, 6]


def equal?(first, second)
    i = 0
    while i < first.length
        if first[i] != second[i]
            return false
        end
        i += 1
    end
    return true
end

p equal?(arr1, arr3)

def equal_with_each(first, second)

    first.each_with_index {|num, index| return false if num != second[index]}

    return true
end

p equal_with_each(arr1, arr3)


##########
p "implicit return is really tricky"

def func(num)
    if num > 0
        true #this is NOT an implicit return, MUST use RETURN statement explicitly
    end

    false # this is implicit
end

p func(6) #===> this will always print false


##################
#######
#IMPORTANT!
#can use loop counters as range integer to form subarrays

"arr[i..j].reduce(:+)"

#INCORRECT
arr = [1, 2, 3, 4, 5]
#arr[0, 1, 2] # INCORRECT doesnt do anything


p "converting from binary to decimal form"

def convert(str)
    str.to_i(2) #the two indicates binary
end

p convert("1001")

############################################
p "There are four different ways to combine elements"

arr = ["a", "b", "c"]

p "#1: permutation" #refers to ordering, order is important
p arr.permutation(3).to_a
p arr.permutation.to_a #default length of arr

p "#2 combination" # refers to whether in set or not, doesnt care about order
# combination requires sets, doesnt care about order
# get all combination of two sets
p arr.combination(2).to_a

#get all combination of all size
p "#3 get all combination of elements"
all_combos = []
i = 0
while i <= arr.length
    subsets = arr.combination(i).to_a
    all_combos.concat(subsets)
    i += 1
end

p all_combos


p "#4 get all permutations of all combinations"
combos = []
i = 0
while i <= arr.length
  possibilities = arr.permutation(i).to_a
  combos.concat(possibilities)
  i += 1
end

p combos
##############################
p "creating commas in numbers"
  while integers.length > 0
        last_three = integers.pop(3).join("")  "IMPORTANT!!!!!!!!!!"
        threes.unshift(last_three)
    end


######################################
p "using .concat"
abc = ["a", "b", "c"]
de = ["d", "e"]

abcde = abc.concat(de)# good! makes all elements the same level

abc << de  #this makes ["a", "b", "c", ["d", "e"]]

################
#swap array elements
arr = ["Hi", "bye!"]

arr[0], arr[1] = arr[1], arr[0]

p arr #["bye!", "Hi"]
# we can use this for sort
def my_sort(arr)

  i = 0
  while i < arr.length
    j = i + 1
    while j < arr.length
      if arr[i] > arr[j]
        arr[i], arr[j] = arr[j], arr[i] # HERE!!!!
      end

      j += 1
    end

    i += 1
  end

  return arr
end

###############
p "check if elements in an array are consecutive"

arr = [1, 2, 3, 4]
def consecutive?(list)

    list == (list.first..list.last).to_a
    # is the array equal to the range created by the first..last elements?

end

consecutive?(arr)

### check longest consecutive subarray
def LongestConsecutive(arr)

  # get unique sorted array

  list = arr.uniq.sort
  # loop through each
  current = 0
  i = 0

  while i < list.length
    j = i + 1
    while j < list.length
        if list[i..j] == (list[i]..list[j]).to_a
            count = list[i..j].length
            if count > current
                current = count
            end
        end
        j += 1
    end
    i += 1
  end


  return current

  # see subsequent j count
  # have a most counter

end

##########################

arr = [2, 3, 4, 5, 2, 5, 2, 6 ,1, 7, 8, 1]

arr.count #returns 12
arr.count(2) #returns 3 (number of 2s in arr)


########################################

p "between?"

p 4.between?(4, 8) #true
p 4.between?(3, 8) #true
p 4.between?(5, 8) #false

#####################################
str = "I am hungry"

str.gsub!("I", "We")
str.split("I").join("We")


#################
p "creating array with default values"
arr = Array.new(4, true)
p arr # [true, true, true, true]
p "create empty matrix"
new_matrix = Array.new(matrix.length) { Array.new(matrix.length) }



def anagram?(string1, string2)

    return true if string1.split("").sort == string2.split("").sort

    return false

end

p "how to switch true to false, false to true easily"
while j <= num_cats
      cats[j] = !cats[j] #here

p "map caution, must have a return value for ALL cases"
def double_if_even(arr)

  arr.map! do |num|
    if num.even? #cant just have if statements
      num *= 2
    else #this else statement is required for mapping or makes [nil, 4, nil, 8, nil]
      num
    end
  end

  arr
end

double_if_even([1, 2, 3, 4, 5])
#####################################

p "MAP MAP"
def function(str)
    sets = str.split(".")

    #must be MAP MAP
    sets.map! do |set|
        set.split("").map!{|string| string.to_i}
    end

    sets
end

p function("234.521.425") #[[2, 3, 4], [5, 2, 1], [4, 2, 5]]



p "reassigning variables. auto copy!"
 arr1 = [1, 2, 3, 4]
 arr2 = arr1
 arr1 = []

 arr2 #this will equal [1, 2, 3, 4]
