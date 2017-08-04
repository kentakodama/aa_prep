def my_sort(arr)

  i = 0
  while i < arr.length
    j = i + 1
    while j < arr.length
      if arr[i] > arr[j]
        arr[i], arr[j] = arr[j], arr[i]
      end
      j += 1
    end
    i += 1
  end
  
  arr

end

my_sort([3, 2, 5, 7, 1, 8, 6, 3])

p "all combinations"

def iterativeSubs(arr)
    prev = [[]]
    arr.each do |el|
       newSubs = prev.map{|subs| subs + [el]}
       prev = prev + newSubs
    end
    prev
end

#[[]] add one to each array element [1]
#[[],[1]] 
#[[], [1]] # add two to each subarray [2], [1, 2]
#[[], [1], [2], [1, 2] #add three to each [3], [1, 3], [2, 3], [1, 2, 3]
#[[], [1], [2], [1, 2] [3], [1, 3], [2, 3], [1, 2, 3]]


p "Common iterations"

#return word with most repeat letters
def LetterCount(str)

  
    words = str.split(" ")
    most = ""
    count = 0
    
    words.each do |word|
        hash = Hash.new(0)
        word.split("").each {|letter| hash[letter] += 1} #must split word
        repeats = hash.select {|letter, count| count >= 2}.size
        if repeats > count
            count = repeats
            most = word
        end
        
    end
    
    return most
         
end

#get the mode
def SimpleMode(arr)
    
    return -1 if arr.uniq == arr
    
    hash = Hash.new(0)
    arr.each {|number| hash[number] += 1}
    hash.max_by {|num, occur| occur}[0] #this gets the first element if there are multiple matches
    
end

def RunLength(str)
    # result
    letters = str.split("")
    result = ""
    #loop through each char
    i = 0
    while i < letters.length
        count = 1
        letter = letters[i]
        j = i + 1 
        while j < letters.length && letters[i..j].uniq.length == 1 #double conditional only unique items
            count += 1
            j += 1
        end
        result += "#{count}#{letter}"
        i = j # so doesnt repeat, reset i at last position of j
    end
   
    result
         
end

#############################################

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

p "combining map and each"
m = [[0,1,0,1,0],
     [0,0,1,1,1],
     [1,0,0,1,0],
     [0,1,1,0,0],
     [1,0,1,0,1]]

#1, this works because you are mapping subarrays and all subarrays constitute entire array
m.each do |subarray|
  subarray.map! do |num|
    if num == 0
      num = nil
    end
    num
  end
end

#2, this works because map twice
m.map do |subarray|
  subarray.map! do |num|
    if num == 0
      num = nil
    end
    num
  end
end

#3, this does NOT work(must have map at end)
m.map do |subarray|
  subarray.each do |num|
    if num == 0
      num = nil
    end
    num
  end
end


def get_substrings(string)
  
  substrings = []
  
  chars = string
  i = 0
  while i < chars.length
    j = i "NOTICE! THIS IS IMPROTANT!"
    while j < chars.length
      substrings << chars[i..j]
      j += 1
    end
    i += 1
  end
  
  substrings
end

get_substrings("abcdefg")



def get_subsets(arr)
  
  combos = [[]]
  arr.each do |el|
    new_subsets = combos.map{|subarray| subarray + [el]}
    combos += new_subsets
  end
  
  combos
  
end

get_subsets([1, 2, 3, 4, 5])
###########################################
def get_repeat_combos(arr, num)
  
  all_elements = []
  arr.each do |el|
    num.times {all_elements << el} "IMPORTANT!!!!"
  end
  
  combos = [[]]
  all_elements.each do |el|
    new_subsets = combos.map{|subarray| subarray + [el]}
    combos += new_subsets
  end
  
  combos.select {|subsets| subsets.length == num} "IMPORTANT!!"

end

get_repeat_combos([1, 2, 3, 4, 5, 6], 3)
##################

def get_permutations(arr)

  arr.permutation.to_a

end

get_permutations([1, 2, 3, 4, 5])

p "this is mapping with while loops the counter in while loop can be used as map"

def only_letters(str)
  
  alphabet = ("a".."z").to_a
  words = str.split(" ")
  words.map! do |word|
    chars = word.split("")
    i = 0
    while i < chars.length
      if !alphabet.include?(chars[i].downcase)
        chars[i] = ""
      end
      i += 1
    end
    chars.join("")
  end
  
  words.join(" ")
  
end

p only_letters("Hello25 this# is a cr%)azy$ senten2ce7")

p "this is using maps only"
def only_letters(str)
  
  alphabet = ("a".."z").to_a
  words = str.split(" ")
  words.map! do |word|
    chars = word.split("")
    chars.map! do |char|
      if !alphabet.include?(char.downcase)
        char = ""
      else
        char
      end
    end
    chars.join("")
  end
  
  words.join(" ")
  
end

p only_letters("Hello25 this# is a cr%)azy$ senten2ce7")

