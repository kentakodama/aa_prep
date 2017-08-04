# sum the array

def get_sum(arr)

  return 0 if arr.empty?
  arr[0] + get_sum(arr[1..-1])
end

#includes?

def includes?(arr, target)

  return false if arr.empty?
  return true if arr[0] ==  target
  includes?(arr[1..-1], target)

end


#my_count

class Array

  def my_count(el)

    return 0 if self.empty?
    return 1 if self[0] == el

    0 + self[1..-1].my_count(el)
  end

  def sorted?
    return true if self.length <= 1
    return false if self[0] > self[1]

    self[1..-1].sorted?

  end

end

p [1, 2, 3, 4, 3].sorted?

class String

  def reverser
    return '' if self.length == 0
    self[1..-1].reverser + self[0]
  end

end

p "hello".reverser

def factorial(num)
  return 1 if num == 1
  num * factorial(num-1)
end


#factorial

#do two strings have a substring in common?

def substrings?(str1, str2)

  return false if str2.length < 2 || str1.length < 2
  return true if str1.include?(str2[0..1])
  substrings?(str1, str2[1..-1])

end

p substrings?('hello', 'bye')

#my_array_difference(arr1, arr2)

def array_difference(arr1, arr2)

  duplicate = arr1.dup
  return duplicate if arr2.empty?
  if duplicate.include?(arr2[0])
    duplicate.delete(arr2[0])
  end

  array_difference(duplicate, arr2[1..-1])

end

p array_difference([2, 3, 1, 4, 6, 2, 4, 2, 4, 2], [2, 4, 6, 8])


#flatten

def my_flatten(arr)
  #notice that its not necessary for the whole function to be recurive
  #there can thus be a result counter that can keep track of things beyond just one cycle

  result = []
  arr.each do |el|
    if el.is_a? Array
      result += my_flatten(el)
    else
      result << el
    end
  end

  result

end

p my_flatten([[1], 2, 3, [[[[4]]]], [5, 6, 7, [8]] ])

#digital_root


def digital_root(num)

  return num if num < 10
  digits = []
  until num == 0
    singles = num % 10
    digits << singles
    num = (num - singles) / 10
  end

  digital_root(digits.reduce(:+))
end

p digital_root(3434)

def digital_root_cycles(num)

  return 0 if num < 10
  digits = []
  until num == 0
    singles = num % 10
    digits << singles
    num = (num - singles) / 10
  end

  1 + digital_root_cycles(digits.reduce(:+))
end

p digital_root_cycles(3434)



def digital_root_wrap(arr)
  results = []
  arr.each do |num|
    results << digital_root(num)
  end
  results
end

p digital_root_wrap((1..50).to_a)

#pascals solution


# Catsylvanian money is a strange thing: they have a coin for every
# denomination (including zero!). A wonky change machine in
# Catsylvania takes any coin of value N and returns 3 new coins,
# valued at N/2, N/3 and N/4 (rounding down).
#
# Write a method `wonky_coins(n)` that returns the number of coins you
# are left with if you take all non-zero coins and keep feeding them
# back into the machine until you are left with only zero-value coins.
#
# Difficulty: 3/5

def wonky_coins1(n)

  return 1 if n == 0 #this is the base case
  wonky_coins(n/2) + wonky_coins(n/3) + wonky_coins(n/4)
end
