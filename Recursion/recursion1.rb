
p "Step 1"
p "Write a recursive solution to find the"
#sum of the integers.

def sum_recur(array) #this almost works
  #base case return when the arrays length is one
  duplicate = array.dup
  if duplicate.length == 1
    return duplicate[0]
  else
    last = duplicate.pop
    duplicate[-1] += last
    sum_recur(duplicate)
  end

end


def sum_katrina(array)
  return 0 if array.empty?
  dup_array = array.dup
  integer = dup_array.shift
  integer += sum_katrina(dup_array)
end
p sum_recur([1, 2, 3, 4])

#basic way
def sum_recur(array)
  return 0 if array.empty?
  array.first + sum_recur(array[1..-1])
end

p "Step 2"
p "create an includes? method that returns true or false whether a arr contains target"
#my way
def includes?(array, target)
  return false if array.empty?
  integer = array[0]
  return true if target == integer
  includes?(array[1..-1], target)
end

p "MUCH BETTER! WAY"
def includes?(array, target)
  return false if array.empty?
  array.first == target || includes?(array[1..-1], target)
end


p includes?([1, 2, 3, 4], 4)


p "Step 3 my_count"
def my_count(array, target)

  count = 0
  duplicate = array.dup
  return 0 if duplicate.empty?
  count += 1 if duplicate.shift == target
  count += my_count(duplicate, target)

end

#other way
def my_count(array, target)
  return 0 if array.empty?
  match = array.first == target ? 1 : 0
  match + my_count(array[1..-1],target)
end



p my_count([1, 4, 2, 3, 4, 4, 4], 4)


p "Step 4"

# Problem 4: You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)

  duplicate = array.dup
  first = duplicate.shift
  return false if duplicate.empty?
  return true if first + duplicate[0] == 12
  add_to_twelve?(duplicate)
end

p add_to_twelve?([2, 3, 1, 4, 5, 6, 6])

p "Much Better way!"
def add_to_twelve?(array)
  return false if array.size < 2
  array[0] + array[1] == 12 || add_to_twelve?(array[1..-1])
end


p "Step 5"
p "Returns whether true or false if sorted in ascending order"
# Problem 5: You have array of integers. Write a recursive solution to determine
# if the array is sorted.

#my solution
def sorted?(array)
  duplicate = array.dup
  first_num = duplicate.shift
  return true if duplicate.empty?
  return false if first_num > duplicate.first
  sorted?(duplicate)
end


def sorted?(array)
  return true if array.length < 2
  array[0] <= array[1] && sorted?(array[1..-1])
end


p sorted?([1, 2, 3, 5, 4])

p 'Step 6'
p 'my_reverse with recursion'
# Problem 6: Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)

  return string if string.length <= 1
  string[-1] + reverse(string[0...-1])

end

p reverse('hello')
