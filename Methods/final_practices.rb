p "homework"

# Write a function that takes an array of words and returns the words whose vowels appear in order

def ordered_vowels(words)
    return words if words.length == 0
    vowels = "aeiou".split("")
    results = []
    #take in array of words and filter out ones that dont have vowels in order
    
    words.each do |word|   #cano only select when array
        just_vowels = word.split("").select{|char| vowels.include?(char)}
        just_vowels.uniq!
        if just_vowels == just_vowels.sort
            results << word
        end
    end
    
    results
    # for each word, get just the vowels, get uniq, and compare to sorted order
    
    #if order the same, push to results
    
    #return array
    
end



# ************************************
# Write a method that takes a string of lower case words (no punctuation) and returns the letter that occurs most frequently.
# Use a hash within your method to keep track of the letter counts.  You will need to account for spaces.  There are a few ways you can do this.

def most_frequent_letter(string)
    
    #get rid of spaces
    string.gsub!(" ", "")
    
    hash = Hash.new(0)
    string.split("").each {|char| hash[char] += 1}
    
    #create hash and get max by first index
    hash.max_by{|char, num| num}[0]
    
end

# Write a method that takes a string of lower case words and returns an array of letters that do not occur in the string.
# This problem requires a different approach from the one we used in most_frequent_letter and we will need to show some care
# in how we set up the hash or process it to get the result.  Do you see why?
# We'll need to account for spaces, too.  Again, there are a few ways you can do this.

p "ok to string together"
def missing_letters(string)
    
    alphabet = ("a".."z").to_a
    string.split("").uniq.each {|char|alphabet.delete(char)} #ok to string together
    alphabet
        
end


# chunk an array into nested arrays of length n
def chunk(array, n)
    
    results = []
    until array.empty?
        results << array.shift(n)
    end
    
    results

end

puts "---------chunk-------"
puts chunk([1, 8, 9, 4, "hey", "there"], 2) == [[1, 8], [9, 4], ["hey", "there"]]
puts chunk([10, 9, 8, 7, 6, 5, 4], 3) == [[10, 9, 8], [7, 6, 5], [4]]

# Write a function, `no_repeats(year_start, year_end)`, which takes a
# range of years and outputs those years which do not have any
# repeated digits.
#
# You should probably write a helper function, `no_repeat?(year)` which
# returns true/false if a single year doesn't have a repeat.
#
# Difficulty: 1/5

def no_repeats(start, finish)

    years = (start..finish).to_a
    years.select {|year| unique(year)}

end

def unique(year)

    digits = year.to_s.split("")
    return true if digits == digits.uniq
    
    return false

end

p no_repeats(1987, 2000) #only [1987]



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



def wonky_coins(n)
  return 1 if n == 0

  # call wonky_coins from inside itself. This is called *recursion*.
  return wonky_coins(n / 2) + wonky_coins(n / 3) + wonky_coins(n / 4)
end




# describe "#wonky_coins" do
#   it "handles a coin of value 1" do
#     wonky_coins(1).should == 3
#   end

#   it "handles a coin of value 5" do
#     wonky_coins(5).should == 11
#     # 11
#     # => [2, 1, 1]
#     # => [[1, 0, 0], [0, 0, 0], [0, 0, 0]]
#     # => [[[0, 0, 0], 0, 0], [0, 0, 0], [0, 0, 0]]
#   end

#   it "handles a coin of value 6" do
#     wonky_coins(6).should == 15
#   end

#   it "handles being given the zero coin" do
#     wonky_coins(0).should == 1
#   end
# end


# Write a function word_unscrambler that takes two inputs: a scrambled
# word and a dictionary of real words.  Your program must then output
# all words that our scrambled word can unscramble to.
#
# Hint: To see if a string `s1` is an anagram of `s2`, split both
# strings into arrays of letters. Sort the two arrays. If they are
# equal, then they are anagrams.
#
# Difficulty: 3/5

def word_unscrambler(arr, word)
    
    # get a helper function anangram or not
    
    # fileter out diff lengths
    same_length = arr.select{|dict_word| dict_word.length == word.length}
    
    matches = same_length.select{|string| anagram?(string, word)}
    
    matches
    
    #filter out non anagram words
    
    #

end

def anagram?(string1, string2)

    return true if string1.split("").sort == string2.split("").sort
    
    return false
    
end
 


# describe "#word_unscrambler" do
#   it "handles a simple word" do
#     word_unscrambler("cat", ["tac"]).should == ["tac"]
#   end

#   it "does not inappropriately choose a word" do
#     word_unscrambler("cat", ["tom"]).should == []
#   end

#   it "handles a simple word from a larger dictionary" do
#     word_unscrambler("cat", ["tic", "toc", "tac", "toe"])
#       .should == ["tac"]
#   end

#   it "only handles words of the correct length" do
#     word_unscrambler("cat", ["scatter", "tac", "ca"] ).should == ["tac"]
#   end

#   it "handles multiple successful cases" do
#     word_unscrambler("turn", ["numb", "turn", "runt", "nurt"])
#       .should == ["turn", "runt", "nurt"]
#   end
# end


#### Five Sort ####
    # Write a function that recieves an array of numbers as an argument.
    # It should return the same array with the fives moved to the end.
    # The ordering of the other elements should remain unchanged.
    #
    # For example:
    # nums = [1, 5, 3, 5, 5, 2, 3]
    # sorted = five_sort(nums)
    # sorted #=> [1, 3, 2, 3, 5, 5, 5]
    #
    # Rules
    # * You may not, at any time, create a Several coding classes and self teaching new array.
    # * You are not permitted to call any methods on the array. Only the
    # use of [], []=, and length are permitted.
    
def five_sort(nums)

    p "good way to utilize conditionals"
    i = 0
    while i < nums.length
        if nums[i] == 5
            found = false
            j = i + 1
            while j < nums.length && !found #good use of conditionals
                if nums[j] != 5
                    nums[i], nums[j] = nums[j], nums[i]
                    found = true
                end
                j += 1
            end
        end
        i += 1
    end
    
    nums
            
end
    



#### Merger ####
    # Write a function that takes in two sorted arrays and returns a sorted array that is the
    # combination of the two input arrays (don't use #sort!). You may iterate at most once through
    # each array (i.e. no nested loops).

def merger(arr1, arr2)
  merged = []

  until arr1.empty? || arr2.empty? # this is an interesting way to do it
    if arr1.first <= arr2.first
      merged << arr1.shift
    else
      merged << arr2.shift
    end
  end

  merged + arr1 + arr2
end

def other_products(arr)
  
  #for each element, multiply all other elements
  
  # create a product variable at each iteration
  
  # mulyply by the element if its not the current element
  
  results = []
  i = 0
  while i < arr.length
    product = 1
    j = 0
    while j < arr.length
      if j != i p "HERE!!!!! gets all others "
        product *= arr[j]
      end
      j += 1
    end
    
    results << product
    i += 1
  end
  
  results 
  
  
end

other_products([3, 2, 6, 9])
  


### Cats 'n Hats ###
      # You have 100 cats (You are quite unfortunate to own so many cats!).

      # You have arranged all your cats in a line. Initially, none of your cats
      # have any hats. You take 100 rounds walking around the cats, always starting
      # at the beginning. Every time you stop at a cat, you put a hat on it if it
      # doesn't have one, and you take its hat off if it has one on.

      # The first round, you stop at every cat. The second round, you only stop at
      # every 2nd cat (#2, #4, #6, #8, etc.). The third round, you only stop at
      # every 3rd cat (#3, #6, #9, #12, etc.). You continue this process until the
      # 100th round (i.e. you only visit the 100th cat).

      # Write a program that prints which cats have hats at the end.
      
def cat_hat(num)
    
    arr = (1..num).to_a
    cats = Hash.new
    arr.each{|num| cats[num] = false}
    
    
    i = 1
    while i < cats.size
        j = 1
        while j < cats.size
            if j % i == 0
                cats[j] = !cats[j] # switch true to false false to true
            end
            j += 1
        end
        i += 1
    end
    
    cats.select{|cat, hat| hat}.keys
    
end    

cat_hat(100)



# Even Splitters
# ------------------------------------------------------------------------------
# Return an array of characters on which we can split an input string to produce
# substrings of the same length.

# Don't count empty strings after the split.

# Here's an example for "banana":
#
# "banana".split("a") # => ["b", "n", "n"] (all elements same length)
# "banana".split("b") # => ["", "anana"] (all elements same length - there's only
# one element "anana" because the empty string doesn't count)
# "banana".split("n") # => ["ba", "a", "a"] (all elements NOT same length)
#
# result: ["b", "a"]
def even_splitters(string)
    
    results = []
    letters = string.split("")
    unique = letters.uniq #duplicate?
    
    i = 0
    while i < unique.length #CAN ONLY SPLIT STRING
        split_words = string.split(unique[i])
        split_words.delete("")
        first = split_words[0]
        if split_words.all?{|el| el.length == first.length}
            results << unique[i]
        end
        i += 1
    end
    
    results 
    #get letters we can split on by getting unique elements
    
    # split with each char, delete "" empty strings, get length of first element
    # check if all elements have the same string length
    # if so push char to results


end

#
# ------------------------------------------------------------------------------



puts "-----Even Splitters----"
puts even_splitters("") == []
puts even_splitters("t") == ["t"]
puts even_splitters("jk") == ["j", "k"]
puts even_splitters("xoxo") == ["x", "o"]
puts even_splitters("banana") == ["b","a"]
puts even_splitters("mishmash") == ["m","h"]


# Isogram Matcher
# ------------------------------------------------------------------------------
# An isogram is a word with only unique, non-repeating letters. Given two isograms
# of the same length, return an array with two numbers indicating matches:
# the first number is the number of letters matched in both words at the same position,
# and the second is the number of letters matched in both words but not in the
# same position.

def isogram_matcher(isogram1, isogram2)
  
    # get common, get match in same position
    # position
    positions = 0
    i = 0
    while i < isogram1.length
        if isogram1[i] == isogram2[i]
            positions += 1
        end
        i += 1
    end
    
    # common
    common = (isogram1.split("") & isogram2.split("")).length
    common = common - positions
    
    [positions, common]
    
end

puts "-------Isogram Matcher-------"
puts isogram_matcher("an", "at") == [1, 0]
puts isogram_matcher("or", "go") == [0, 1]
puts isogram_matcher("cat", "car") == [2, 0]
puts isogram_matcher("cat", "tap") == [1, 1]
puts isogram_matcher("home", "dome") == [3, 0]
puts isogram_matcher("gains", "snake") == [0, 3]
puts isogram_matcher("glamourize", "blueprints") == [1, 4]
puts isogram_matcher("ultrasonic", "ostracized") == [3, 4]
puts isogram_matcher("unpredictably", "hydromagnetic") == [1, 8]

