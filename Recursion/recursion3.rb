

def array_diff(arr1, arr2)
  duplicate = arr1.dup
  return duplicate if arr2.empty?
  duplicate.delete(arr2[0]) if duplicate.include?(arr2[0])
  array_diff(duplicate, arr2[1..-1])
end


#variations on flatten


def original_flatten(arr)

  results = []
  arr.each do |el|
    if el.class == Array
      results += original_flatten(el)
    else
      results << el
    end
  end

  results

end



# this is slightly different version of the flatten array.
# WHILE its flattening, it is adding the squared value of each number thats been flattened out from the original array of nested arrays

def SumSquares(arr)
  #first flatten the array inside
  results = 0
  arr.each do |el|
    if el.is_a?(Array)
      results += SumSquares(el)
    else
      results += el**2
    end
  end

  results
end

def reduce(fraction)
  #get factors

  max = fraction.max
  until fraction.all? {|num| num % max == 0}
    max -= 1
  end
  return fraction if max ==  1
  reduce(fraction.map{|num| num/max})

end

def multiply(a, b)
  return 0 if b == 0
  a + mul(a, b-1)
end

p reduce([4, 8])

def digital_root(n)
  return n if n < 10

  digits = []
  until n == 0
    single = n % 10
    digits.unshift(single)
    n = (n-single)/10
  end

  digital_root(digits.reduce(:+))

end



def pascal(depth)

  (1..depth).map {|num|pascal_depth(num)}

end

def pascal_depth(depth)

  return [1] if depth == 1
  next_row(pascal_depth(depth-1))

end

def next_row(arr)

  middle = []
  i = 0
  while i < arr.length-1
    middle << (arr[i] + arr[i+1])
    i += 1
  end
  middle.unshift(1).push(1)
end



p "chris's solution"
def pascal2(num)
  return [[1]] if num == 1
  res = []
  working_array = pascal2(num-1).last
  res += pascal2(num-1)
  res << next_row(working_array)
  res

end

def next_row(arr)

  middle = []
  i = 0
  while i < arr.length-1
    middle << (arr[i] + arr[i+1])
    i += 1
  end
  middle.unshift(1).push(1)
end

pascal2(4)


def mormons(starting_number, reach, target)

  return 0 if target <= starting_number
  starting_number = (starting_number * reach) + starting_number
  1 + mormons(starting_number, reach, target)

end


def persistence(n)

    return 0 if n < 9
    digits = []
    until n == 0
      single = n % 10
      digits << single
      n = (n-single)/10
    end
    1 + persistence(digits.reduce(:*))

end


def sequence_sum(begin_number, end_number, step)
  #your code here

  return end_number if begin_number >= end_number

  new_number = begin_number + step unless begin_number + step > end_number

  begin_number + sequence_sum(new_number, end_number, step)

end

sequence_sum(1, 5, 3)
