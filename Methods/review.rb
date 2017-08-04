
p "review these problems"
def FormattedDivision(num1,num2)

    #float divide
    
    quot = num1.fdiv(num2)
    return "#{quot.to_s}"  if quot < 1
    
    num_array = quot.to_s.split(".")
    decimal = num_array.last
    integers = num_array.first.split("")
    threes = []

    while integers.length > 0
        last_three = integers.pop(3).join("")  "IMPORTANT!!!!!!!!!!"
        threes.unshift(last_three)
    end
    p threes
    joined_integers = threes.join(",")# must store conversion in var 
 
  
    return "#{joined_integers}.#{decimal}"
    
end

FormattedDivision(503394930, 43)


##########################
# USE CONDITIONAL TO BREAK OUT OF LOOP
def NearestSmallerValues(arr)

    # results array
    results = []
    # loop forward
    i = 0
    while i < arr.length
  
        if arr[0..i].any? {|num| num < arr[i]}
            found = false # use this for the conditional below
            j = i-1
            while j >= 0 && !found #this is the smart way, dont use counter reset to escape
                if arr[j] < arr[i]
                    results << arr[j]
                    found = true
                end
                j -= 1
            end
        else
            results << -1
        end
        i += 1
    end
    
    results.join(" ")
   
end



def SimplePassword(str)

    
#     1. It must have a capital letter.
# 2. It must contain at least one number.
# 3. It must contain a punctuation mark.
# 4. It cannot have the word "password" in the string.
# 5. It must be longer than 7 characters and shorter than 31 characters.
    
    return false if (str.downcase.include? "password") || !(str.length.between?(8, 30)) 
    
    chars = str.split("")
    

    return false if chars.all? {|char| char != char.to_i.to_s}
    
    return false if (chars & ["!", ".", ",", "?", "/", ":", ";", "="]).empty?
    
    return false if chars.all? {|char| char.downcase == char}
        
    return true
    
    
end


def LongestConsecutive(arr)

  # get unique sorted array
  
  list = arr.uniq.sort
  # loop through each
  current = 0
  i = 0
  
  while i < list.length
    j = i + 1
    while j < list.length
        if list[i..j] == (list[i]..list[j]).to_a "this is the important part"
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
   
   

#      #
#     ##
#    ###
#   ####
#  #####
# ######

# if num 3

def staircase(num)
    p "" if num == 0
    # create loop that goes from 1 to num
    
    # difference between put/p: adds \n and print: same line
    
    i = 1
    while i <= num
        spaces = " "*(num-i)
        hashes = "#"*i
        
        p "#{spaces}#{hashes}"
        
        i += 1
    end
    
    # prints string
    # " " num - i + # i
    
    # create end statements at same time as opening it
    # if/end etc
end



m1 = [
    [9,3,4],
    [10,7,6],
    [12,5,8]
    ]
    
# input m1, output [[3,4,5], [6,7,8], [9,10,12]]

def sort_matrix(matrix)
    rows = matrix.length    
   arr = matrix.flatten.sort
   #flatten to i d array
   # sort array
   # create matrix newly sorted
   
   arr.each_slice(rows).to_a
   #each slice method!!!!
    
        
end



#Rearrange characters in a string such that no two adjacent are same
# Given a string with repeated characters, task is rearrange characters in a string so that no two adjacent characters are same.

# Note : It may be assumed that the string has only lowercase English alphabets.


#Rearrange characters in a string such that no two adjacent are same
# Given a string with repeated characters, task is rearrange characters in a string so that no two adjacent characters are same.

# Note : It may be assumed that the string has only lowercase English alphabets.

def rearrange(str)
  
  #must be arr
  letters = str.split("")
  
  #check whether possible
  hash = Hash.new(0)
  letters.each {|letter| hash[letter] += 1 }
  most = hash.values.max
  
  return "not possible" if most > (letters.length/2.0).ceil
  #baaabb
  letters.sort! p "this is important SORT to lump all together"
  #aaabbb
  i = 0
  while i < letters.length
    if letters[i] == letters[i+1]
      j = i + 1
      found = false
      while j < letters.length && !found
        if letters[j] != letters[i]
          letters[i+1], letters[j] = letters[j], letters[i+1]
          found = true
        end
        j += 1
      end
    end
    i += 1
  end
      
  #loop thru and switch positions
  letters.join("")

end


#how to find PRIME factors of a num


def get_factors(num)
  
  factors = []
  i = 2
  while i <= num
    if prime?(i) && num % i == 0
      until num % i != 0
        num /= i
        factors << i
      end
    end
    i += 1
  end
  
  factors

end

def prime?(num)
  return true if num == 2
  return false if num <= 1
  i = 2
  while i < num
    if num % i == 0
      return false
    end
    i += 1
  end
  
  return true
  
end



get_factors(213)


def koltaz(num)

  results = [num]
  until results.last == 1
    if results.last.even?
      num /= 2
    else
      num = (3*num) + 1
    end
    
    results << num
  end
  
  results.length
  
end


def StringScramble(str1,str2)

    first = str1.split("")
    second = str2.split("")
    
    second.all? {|char| first.include? char}
         
end


def SimpleMode(arr)
    
    hash = Hash.new(0)
    arr.each {|num| hash[num] += 1}
    
    hash.max_by {|k, v| v}[0]
    #this will return the first max if there are two of the same value
         
end
   
   
SimpleMode([1, 2, 2, 1])


def CaesarCipher(str,num)
    num = num.to_i
  # create alphabet array
  letters = str.split("")
  alphabet = ("a".."z").to_a
  results = []
  # check index of each char, add num, and find index of that make sure to mod 26
  

  i = 0
  
  while i < letters.length
    capital = false
    if letters[i].upcase == letters[i]
        capital = true
        letters[i].downcase! #downcase HERE!!
    end
    

                        #### DONT DOWNCASE HERE
    char = alphabet[(alphabet.index(letters[i])+num) % 26]
    
    
    if capital
        char.upcase!
    end
    
    results << char
    i += 1
  end
  
  results.join("")
  
  # adjust for capitals, while checking index, figure out if upcase and downcase, upcase downcase if necessary
end

arr = [1, 2, 3, 4, 5, 6, 7, 8]


def reducer(arr)

  until arr.length == 1
    arr = arr.select do |el|
      arr.index(el).even?
    end
    arr.reverse!
  end
  
  arr[0]

end

def substrings_count(string)
#return nil if empty

    return nil if string == ""

# assume lowercase
    combos = []
# get all substrings and push to combo array
    chars = string.split("")
    i = 0   #[a, b, c]
    while i < chars.length
        # i = 1
        # j = 0
        
        j = i # another way to do this, make sure j does go below i
        while j < chars.length
            substring = chars[i..j].join("")
            combos << substring
            j += 1
        end
        i += 1
    end
# filter combo array for same first and last char
    filtered = combos.select {|substring| substring[0] == substring[-1]}
# get the count for filtered array
    filtered.length
end


p substrings_count("abcab") == 7




# Find largest word in dictionary by deleting some characters of given string
# Giving a dictionary and a string ‘str’, find the longest string in dictionary which can be formed by deleting some characters of the given ‘str’.

# Examples:

# Input : dict = ["ale", "apple", "monkey", "plea"]  
#         str = "abpcplea"  
# Output : apple 

# Input  : dict = ["pintu", "geeksfor", "geeksgeeks", "forgeek"]
#          str = "geeksforgeeks"
# Output : geeksgeeks


def longest_sub(dictionary, string)
    
    # return nil if it doesnt exist
    
    return nil if string == ""
    longest = ""
    # check each of the dictionary words 
    dictionary.each do |word|
        # str = "helo" word = "hello"
        # ["h", "e", "l"] == ["h", "e", "l", "l"] => false
        duplicate = string.dup
        count = 0
        word.split("").each do |char|
            i = 0
            while i < duplicate.length
                if char == duplicate[i]
                    count += 1
                    duplicate.slice!(i, 1)
                end
                i += 1
            end
            
            if count == word.length
                if word.length > longest.length
                    longest = word
                end 
            end
            
        end

    end
    
    return "not possible" if longest.length == 0
    
    longest
    # if possible to delete the string char to make a particular word
    # have a counter that updates accordingly for longest value
    
    
end

#################################
p "how to build out an array in a pattern"
    
    #example 1
    arithmetic = [arr[0]]
    until arithmetic.length == arr.length
        sum = arithmetic.last + diff
        arithmetic << sum
    end

    
    #example 2
    #fibanacci
def nth_fib(nth)
    
    fib = [1, 2]
    until fib.length >= nth
        next_el = fib[-2..-1].reduce(:+)
        fib << next_el
    end
    
    fib[-1]
end

def sum_sequence(nth)
    return nil if nth < 1
    results = [1, 2]
    until results.length >= nth
        next_element = results.reduce(:+)    
        results << next_element
    end
    
    results[-1]
end
    
##########################################################################
    
def nth_palindrome(n, k)
    # catch false values 
    #helper function to check if palindrome
    
    # start count at the lowest of k digits
    
    start = 10**(k-1)
    finish = 10**(k)
    
    results = []
    i = start
    while i < finish
        if palindrome?(i)
            results << i
        end
        i += 1
    end
    
    return "Does not exist" if n > results.length
    
    results[n-1]
end

def palindrome?(num)
    
    str = num.to_s
    reversed = str.reverse
    if str == reversed
        return true
    else
        return false
    end
    
end
###################################


p "without division!!!"
def array_products(arr)

    
    results = []
    i = 0 
    while i < arr.length
        copy = arr.dup
        copy.slice!(i, 1)
        product = copy.reduce(:*)
        results << product
        i += 1
    end
    
    results 

end
####################################
def staircase(num)
    p "" if num == 0
    # create loop that goes from 1 to num
    
    # difference between put/p: adds \n and print: same line
    
    i = 1
    while i <= num
        spaces = " "*(num-i)
        hashes = "#"*i
        
        p "#{spaces}#{hashes}"
        
        i += 1
    end
    
    # prints string
    # " " num - i + # i
    
    # create end statements at same time as opening it
    # if/end etc
end

# Write a method that takes a string in and returns true if the letter
# "z" appears within three letters **after** an "a". You may assume
# that the string contains only lowercase letters.
#
# Difficulty: medium.


p "use restriction in conditional not the counter"
def nearby_az(string)
  idx1 = 0
  while idx1 < string.length
    if string[idx1] != "a"
      idx1 += 1
      next
    end

    idx2 = idx1 + 1
    while (idx2 < string.length) && (idx2 <= idx1 + 3) ### HERE
      if string[idx2] == "z"
        return true
      end

      idx2 += 1
    end

    idx1 += 1
  end

  return false
end



# Write a method that takes an array of numbers in. Your method should
# return the third greatest number in the array. You may assume that
# the array has at least three numbers in it.
#
# Difficulty: medium.

def third_greatest(nums)
  first = nil
  second = nil
  third = nil

  idx = 0
  while idx < nums.length
    value = nums[idx]
    if first == nil || value > first
      third = second
      second = first
      first = value
    elsif second == nil || value > second
      third = second
      second = value
    elsif third == nil || value > third
      third = value
    end

    idx += 1
  end

  return third
end




def letter_count(str)
  counts = Hash.new(0)

  str.each_char do |char|
    counts[char] += 1 unless char == " "
  end
  counts
end

p "is it possible to get any words in the arr by deleting char from the funky string"

def deleted?(arr, funky)
  
  results = []
  arr.each do |word|
    
    combos = funky.split("").combination(word.length).to_a
    combos.map!{|combo| combo.sort}
    
    results << word if combos.include?(word.split("").sort)
  end
  
  results
    
end


deleted?(["hi", "char", "bye", "nice", "great", "thanks"], "jkdhnsrlkeica")


p "be careful for evaluation errors"

def third(arr)
  
  first = nil
  second = nil
  third = nil
  #iterate through each
  arr.each do |num|
    if first == nil || num > first  #the order of the nil comparison must be first
      third = second
      second = first
      first = num
    elsif second == nil || num > second  
      third = second
      second = num
    elsif third == nil || num > third
      third = num
    end
  end
  # compare with first, second, third, and assign if the num is bigger than one or value is nil
  #assign it num to that var and push first to second second to third etc
  
  third
  #return the third largest
  
end

def ClosestEnemy(arr)
    
    # find the 1 index
    start = arr.index(1)
    # set right and left as same 1 index
    right = start
    left = start
    #
    #set count
    count = 0
    # until reach the ends of the array
    until left == 0 && right == arr.length-1
        left -= 1 if left != 0
        right += 1 if right != arr.length-1
        count += 1
        if arr[left..right].include?(2)
            return count
        end
        
    end
    # check if the range created by right and left contains a 2
    # if contains a 2 then return the count
    # expand right and left limits unless at the outer edge
    #every time expand, increment count
    return 0
          
end


def ClosestEnemyII(strArr)
    
    matrix = strArr
    #find 1 coordinates
    oneX = nil
    oneY = nil
    i = 0
    while i < matrix.length
        j = 0
        while j < matrix[i].length
            if matrix[i][j] == "1"
                oneX = j
                oneY = i
            end
            j += 1
        end
        i += 1
    end
    min_moves = nil
    y = 0
    while y < matrix.length
        x = 0
        while x < matrix[y].length
            total_moves = 0
            if matrix[y][x] == "2" #below is tricky, good technique to get min
                y_moves = [(oneY-y).abs, (matrix.length - (oneY-y).abs)].min
                x_moves = [(oneX-x).abs, (matrix[y].length - (oneX-x).abs)].min
                total_moves = y_moves + x_moves
                if min_moves == nil || total_moves < min_moves
                    min_moves = total_moves
                end
            end
            x += 1
        end
        y += 1
    end
    
    min_moves
    #loop thru to find all 2s
    # when find 2 
    # get diff in x and y values and check how many moves
     #get the abs diff between the x1 and x2 and subtract from length of x
  # same with y
    # have a min move that updates
   
  
         
end


def ThreeNumbers(str)

    #for each word
    words = str.split(" ")
    
    #exactly three unique nums, check if num, if yes push to nums array, get uniq and see if same length, return false if not
    words.each do |word|
       #unique test
       nums = []
       i = 0
        while i < word.length
            if word[i] == word[i].to_i.to_s
                nums << word[i]
            end
            i += 1
        end
        return false if nums.length != 3
        return false if nums.uniq.length != 3
        
        first = word.index(nums[0])
        last = word.index(nums[2])
        return false if last-first == 2
       
    end
    
    true
    
    # within same iterationg, cant all be adjacent if the diff in index of first and last is 2 return false
    
    # return true
    
end


def NumberAddition(str)

    nums = []    
  #check if something number, if num start another loop while the next is a num, take the string of nums and join and TO I
    i = 0
    while i < str.length
        if str[i] == str[i].to_i.to_s
            digits = [str[i]]
            j = i+1
            while j < str.length && str[j] == str[j].to_i.to_s
                digits << str[j]
                j += 1
            end
            number = digits.join("").to_i
            nums << number
            i = j
        else
            i += 1
        end
    end
  # num string to i 
  #check if its multi digit
  # add those together]
  
  nums.reduce(:+)
         
end


p "replace non letters with a space then split to words"

  
    j = 0
    while j < chars.length
      if !alphabet.include? chars[j]
        chars[j] = " "
      end
      j += 1
    end
    
p "extract all nums from a string/nums with multiple digits"    
def just_nums(str)
  
  chars = str.split("")
  results = []
  i = 0
  while i < chars.length
    if chars[i] == chars[i].to_i.to_s
      j = i + 1
      while j < chars.length && chars[j] == chars[j].to_i.to_s
        j += 1
      end
      results << chars[i...j].join("").to_i
      i = j
    else
      i += 1 #this is important to increment in else
    end
  end
  
  results

end  

just_nums("hbjwerjn294u2pl2mr 3k2l3lm1nh444i2k3m44 3n22")


    
    min = arr[0]
    max = arr[0]
    
    arr.each do |num|
        if num < min  #update both min and max within same loop
            min = num
        elsif num > max
            max = num
        end
    end
    
    
    

def longest_letter_streak(str, search_letters)
    greatest = 0
    letters = str.split("")
    
    i = 0
    while i < letters.length do
        if search_letters.include?(letters[i])
            j = i + 1
            
            while j < letters.length && search_letters.include(letters[j]) do
                j += 1
            end
            
            streak = letters[i...j].length
            
            if streak > greatest
                greatest = streak    
            end
            
            i = j
        else
          i += 1  
        end
    end
    
    greatest
end

def longetst(str, search_letters)
    longest_streak = 0
    current_streak = 0
    letters_streak = ''
    curr_lett_streak = ''
    
    str.each_char do | char |
        if search_lettes.include?(char)
            current_streak += 1
            curr_lett_streak += char
            
            if current_streak > longest_streak
                longest_streak = current_steak
                letters_streak = curr_letters_streak
            end
        else
            current_streak = 0
            curr_letters_streak = ''
        end
    end
    
    letters_streak
end    
    