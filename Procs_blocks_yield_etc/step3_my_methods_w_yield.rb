p "SECTION ONE"
p 'My map! method: three ways same effect'
class Array

  def my_map_yield!
    self.each_index do |i|
      self[i] = yield(self[i])
    end
    self
  end

  def my_map_proc!(&prc)
    self.each_index do |i|
      self[i] = prc.call(self[i])
    end
    self
  end

  def my_map_proc_yield!(&prc)
    self.each_index do |i|
      self[i] = yield(self[i])
    end
    self
  end

end
p "These all have the same effect as eachother"
p [1, 2, 3, 4].my_map_yield! {|el| el*el}
p [5, 6].my_map_proc! {|el| el*el}
p [7, 8, 9].my_map_proc_yield! {|el| el * el}


p 'SECTION TWO'
p 'My Map(non-bang) method that relies on my_map!'

class Array
  #step one: define bang version from any one of above
  def my_map!
    self.each_index do |i|
      self[i] = yield(self[i])
    end
    self
  end
  #step two: create a non-bang version that relies on bang version

  #this doesnt work
  def my_map_failed #no way to accept a block/proc
    duplicate = self.dup
    duplicate.my_map! #no way to pass on a proc to dependent method
  end

  #this works
  def my_map(&prc) #must take a proc
    duplicate = self.dup
    duplicate.my_map!(&prc) # and pass it off to dependent method
  end
end


p 'If passing in a proc two ways'
# set up proc here
doubler = Proc.new {|num| num * 2}
#first way
class Array

  def my_map!(&prc)
    self.each_index do |i|
      self[i] = prc.call(self[i])
    end
    self
  end

end

[1, 2, 3].my_map!(&doubler) #with ampersand//converts proc to block
#second way with yield
class Array

  def my_map!
    self.each_index do |i|
      self[i] = yield(self[i]) #with yield
    end
    self
  end

end

[1, 2, 3].my_map!(&doubler) #with ampersand // converts proc to block



##############################################

p 'SECTION THREE: MORE EXAMPLES WITH EACH'
#first way with yield

class Array
  def my_each
    i = 0
    while i < self.length
      yield(self[i]) #different but same effect as below
      i += 1
    end
    self # must return something
  end
end


#calling proc on elements
class Array
  def my_each(&prc)
    return self unless block_given?
    i = 0
    while i < self.length
      prc.call(self[i]) #yield(self[i]) is the same
      i += 1
    end
    self # must return something
  end
end




p "SECTION FOUR: OTHER MONKEY PATCH METHODS"

class Array

  def my_select(&prc) #with or without doesnt matter
    results = []
    self.my_each do |el|
      results << el if yield(el)
    end
    results
  end

  def my_reduce_yield
    duplicate = self.dup #make sure to dup BEFORE shift
    accumulator = duplicate.shift
    duplicate.each do |el|
      accumulator = yield(accumulator, el)
    end
    accumulator
  end

  def my_reduce_proc(&prc)
    duplicate = self.dup
    accumulator = duplicate.shift
    duplicate.each do |el|
      accumulator = prc.call(accumulator, el)
    end
    accumulator
  end

end

p 'These all work'
arr = [2, 3, 5, 8]
p arr.my_reduce{|a, b| a + b}
p arr.my_reduce(&:+) #must add an ampersand
p arr.my_reduce(&:*) #must add an ampersand

p [1, 2, 3, 4, 56].my_select {|num| num.even?}
p [1, 2, 3, 4, 56].my_select(&:even?)


class Array
  def bubble_sort!(&prc)
    return self if self.lenght <= 1

    #default proc to call during method
     prc ||= Proc.new{|a, b| a <=> b}

     i = 0
     while i < self.length
       j = i + 1
       while j < self.length
         self[i], self[j] = self[j], self[i] if prc.call(self[i], self[j]) == 1
         j += 1 #above takes care of any relationship
       end
       i += 1
     end
     self
   end

  def bubble_sort(&prc)
    duplicate = self.dup
    duplicate.bubble_sort!(&prc)
  end

end

p [1, 5, 2, 6, 1, 5, 8, 2, 11, 2, 21, 4].bubble_sort!
p [1, 5, 2, 6, 1, 5, 8, 2, 11, 2, 21, 4].bubble_sort! {|a, b| b <=> a }
p [3, 4, 1, 2, 5].bubble_sort {|a, b| b <=> a}
words = 'hello this is a crazy sentence that I made'.split(' ')
p words.bubble_sort! {|a, b| b.length <=> a.length}


class Hash
  #watch out! must take a hash and an optional proc
  def my_merge(other_hash, &prc)
    #set default proc
    prc ||= Proc.new {|key, old_value, new_value| new_value }

    results = Hash.new

    #first create a copy of hash1
    self.each do |k, v|
      results[k] = v
    end
    #second, iterate through hash2
    other_hash.each do |k, v|
      #this simply adds key values that dont overlap
      if results[k].nil?
        results[k] = v
      else
      #this sets new value to return value of the proc
      results[k] = prc.call(k, results[k], v)
      end
    end
    results
  end
end


hash1 = { a: 10, b: 2 }
hash2 = { a: 5, b: 10, c: 3 }

p hash1.my_merge(hash2) #default proc
p hash1.my_merge(hash2) {|key, old_value, new_value| old_value} #set overlap to old
p hash1.my_merge(hash2){ |key, oldval, newval| newval - oldval } #set overlap to new minus old






class Hash

  #this way works
  def my_sort_by(&prc)
    #set default proc
    prc ||= Proc.new{|k, v| k}
    #first create and array
    arr = []
    self.each do |k, v|
      arr << [k, v]
    end
    # given k and v, if k means zero index, v means 1 index
    i = 0
    while i < arr.length
      j = i + 1
      while j < arr.length #calls proc on inputs and compares outputs
        if prc.call(arr[i][0], arr[i][1]) > prc.call(arr[j][0], arr[j][1])
          arr[i], arr[j] = arr[j], arr[i]
        end
        j += 1
      end
      i += 1
    end
    # iterate thru arr of arrs and sort based on 0 or 1 index
    arr
  end

  #this way doesnt work 
  def my_sort_by_fucked_version(&prc)

    arr = []
    self.each do |k, v|
      arr << [k, v]
    end

    i = 0
    while i < arr.length
      j = i + 1
      while j < arr.length
        #decides whether its
        p "THIS DOESNT WORK! because it cant get the return value from the proc"
        p "For example what if we wanted to compare the lengths of values instead, that would mean key.length "
        if prc.call('key', 'value') == "key"
          if arr[i][0] > arr[j][0]
            arr[i], arr[j] = arr[j], arr[i]
          end
        else
          if arr[i][1] > arr[j][1]
            arr[i], arr[j] = arr[j], arr[i]
          end
        end
        j += 1
      end
      i += 1
    end

    arr

  end


end


hash = {cats: 4, dogs: 2, snakes: 6, puppies: 1}

p hash.my_sort_by{|animal, number| number}
