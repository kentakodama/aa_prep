
class Array

  def my_reduce(&prc)
    duplicate = self.dup
    accumulator = duplicate.shift
    duplicate.each do |el|
      accumulator = prc.call(accumulator, el)
    end

    accumulator
  end

  p "This uses only each index via the each method"
  def my_flatten_version_1
    results = []
    (0..self.length-1).each do |i| # interesting way to access index
      if self[i].class == Array
        results += self[i].my_flatten
      else
        results << self[i]
      end
    end
    results
  end

  p "this uses each with index"
  def my_flatten_version_2
   results = []
   self.each_with_index do |el, i|
     if el.class == Array
       #both of the below recursions work the same
       results += el.my_flatten
       #results += self[i].my_flatten
     else
       results << el
     end
   end

   results
 end


   def my_reduce_optional(acc = nil, &prc)
    duplicate = self.dup
    if acc.nil?
      accumulator = duplicate.shift
    else
      accumulator = acc
    end
    duplicate.each do |el|
      accumulator = prc.call(accumulator, el)
    end

    accumulator
  end


  def my_max
    self.my_reduce do |accum, other_num|
      if accum < other_num
        other_num
      else
        accum
      end
    end

  end

  def my_min
    self.my_reduce do |accum, other_num|
      if accum > other_num
        other_num
      else
        accum
      end
    end

  end

  def yall?(&prc)
    self.each do |el|
      if prc.call(el) == false
        return false
      end
    end
    true
  end

  def my_any?(&prc)
    self.each do |el|
      return true if prc.call(el)
    end
    false
  end

  #this gets common elements but keeps dups
  def my_common_duplicates(other_array)
    main = self.dup
    other = other_array.dup
    common = []
    main.each do |el|
      #check the count of each element in both arrays
      count = [self.count(el), other.count(el)].my_min
      unless common.include?(el)
        count.times {common << el}
      end
    end
    common
  end

  def my_common_uniq(other_array)

    self.my_common_duplicates(other_array).my_uniq

  end



  def my_uniq
    unique = []
    self.each do |el|
      unique << el unless unique.include?(el)
    end
    unique
  end


  def my_zip(arr1, arr2)
    #first create as many sub arrays as there are elements in self


    results = Array.new(self.length) {Array.new(self.length)}
    self.each_with_index do |el, i|
      results[i][0] = el
    end

    until arr1.length == self.length
      arr1 << nil
    end

    arr1.each_index do |i|
      results[i][1] = arr1[i]
    end

    until arr2.length == self.length
      arr2 << nil
    end

    arr2.each_index do |i|
      results[i][2] = arr2[i]
    end

    results[0...self.length]
    #iterate through the first array and push each element to the results array index of its array

  end



end

proc = Proc.new {|a, b| a + b}
p [1, 2, 3].my_reduce_optional(100, &proc)

[1, 2, 3, 3].my_common_duplicates([1, 2, 3, 3, 3, 3])
