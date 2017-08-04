#create my_sum

array = [2, 5, 2, 5, 3, 1, 1, 4, 132]

def kenta_sum(arr)
  #basecase
  return 0 if arr.empty?
  arr[0] + kenta_sum(arr[1..-1])
end

p array.reduce(:+)
p kenta_sum(array)

def kenta_product(arr)
  return arr[0] if arr.length == 1
  arr[0] * kenta_product(arr[1..-1])
end

p kenta_product([1, 2, 2, 4])

p array.reduce(:*)
p kenta_product(array)

#create my_factorial

def kenta_factorial(num)
  return 1 if num == 1
  num * kenta_factorial(num - 1)
end

#create my_count
p kenta_factorial(5)

#return true or false if both strings have a substring in common
def substring_test(str1, str2)
  #basecase
  if str1.length <= 1 || str2.length <= 1
    return false #if either one of the strings starting or remaining are length one
  elsif str1.downcase.include?(str2[0..1].downcase)
    return true # returns true if the first two letters of modified str2 are in included in the str1
  else #strip away the first char and repeat
    substring_test(str1, str2[1..-1])
  end
end

substring_test("Something","Home")



#subtract arr2 from arr1 and leave unique items
def my_arr_diff(arr1, arr2)

  duplicate = arr1.dup
  return duplicate if arr2.empty?
  duplicate.delete(arr2[0]) if duplicate.include?(arr2[0])
  my_arr_diff(arr1, arr2[1..-1])
end
