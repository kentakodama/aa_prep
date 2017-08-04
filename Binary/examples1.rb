# Write a method that given a letters representation of a binary number will
# return that binary number in base 10.
#
# To convert from binary to base 10, we take the sum of each digit multiplied by
# two raised to the power of its index. For example:
#   1001 = [ 1 * 2^3 ] + [ 0 * 2^2 ] + [ 0 * 2^1 ] + [ 1 * 2^0 ] = 9
#
# You may NOT use the Ruby String class's built in base conversion method.

def base2to10(binary)
  #split to single digits
  digits = binary.split('').map{|str| str.to_i}.reverse
  #loop through multiply by 2 raised to index and add to result
  result = 0
  digits.each_with_index do |num, i|
    result += (num *(2**i))
  end
  result
end
