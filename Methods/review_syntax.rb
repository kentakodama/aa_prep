
p "review syntax"

#find area of a rectangle with given coordinates


def area(arr)
  
  x_values = []
  y_values = []
  arr.each do |xy|
    x_values << xy.first
    y_values << xy.last
  end
  
  xmin = x_values.min
  xmax = x_values.max
  
  ymin = y_values.min
  ymax = y_values.max
  
  area = (ymax - ymin) * (xmax - xmin)
  
  area
end

area([[0, 4], [0, 0], [6, 0],[6, 4]])




# Write a function, `rec_intersection(rect1, rect2)` and returns the
# intersection of the two.
#
# Rectangles are represented as a pair of coordinate-pairs: the
# bottom-left and top-right coordinates (given in `[x, y]` notation).
#
# Hint: You can calculate the left-most x coordinate of the
# intersection by taking the maximum of the left-most x coordinate of
# each rectangle. Likewise, you can calculate the top-most y
# coordinate of the intersection by taking the minimum of the top most
# y coordinate of each rectangle.
#
# Difficulty: 4/5



def rec_intersection(rect1, rect2)
  x_min = [rect1[0][0], rect2[0][0]].max
  x_max = [rect1[1][0], rect2[1][0]].min

  y_min = [rect1[0][1], rect2[0][1]].max
  y_max = [rect1[1][1], rect2[1][1]].min

  return nil if ((x_max < x_min) || (y_max < y_min)) # no overlap
  return [[x_min, y_min], [x_max, y_max]]
end


def area_common(rect1, rect2)
  
  xmin = [rect1[0][0], rect2[0][0]].max
  xmax = [rect1[1][0], rect2[1][0]].min
  
  ymin = [rect1[0][1], rect2[0][1]].max
  ymax = [rect1[1][1], rect2[1][1]].min
  
  return "no overlap" if (xmax < xmin) || (ymax < ymin)
  
  area = (xmax-xmin) * (ymax-ymin)
  
  area
end

area_common([[0, 0], [3, 2]], [[1, 1], [4, 3]])


p "matrix problems"
p "spiral"

m = [[1, 2, 3, 4],
     [5, 6, 7, 8],
     [9, 10, 11, 12],
     [13, 14, 15, 16]]
          
def spiral(matrix)
  p "be careful for order of defining variables"
  p "becareful to do length minus one"
  y_min = 0
  y_max = matrix.length-1
  x_min = 0
  x_max = matrix[0].length-1
  
  results = []
  while y_min <= y_max && x_min <= x_max p "this is good"
    
  #top
    i = x_min
    while i <= x_max
      results << matrix[y_min][i]
      i += 1
    end
    y_min += 1
  #right
    i = y_min
    while i <= y_max 
      results << matrix[i][x_max]
      i += 1
    end
    x_max -= 1
      
  #bottom
    i = x_max
    while i >= x_min  
      results << matrix[y_max][i]
      i -= 1
    end
    
    y_max -= 1
    
  #left
    i = y_max
    while i >= y_min
      results << matrix[i][x_min]
      i -= 1
    end
    x_min += 1
    
  end
  
  results.flatten
  
end
    
    
p spiral(m)

 #################################
 def second_island_count(matrix)
  
    count = 0
    y = 0
    while y < matrix.length
        x = 0
        while x < matrix[y].length  #this is the second version
            if matrix[y][x] == 1 
                count += 1
                if x+1 < matrix[y].length && matrix[y][x+1] == 1
                    count -= 1    #tricky when index goes beyond arr
                end
                if y+1 < matrix.length && matrix[y+1][x] == 1
                    count -= 1 #we do minus one at each because we know there is another one below
                end
            end
            x += 1
        end
        y += 1
    end
    count
end

#####################
p "how to reverse matrix columns and rows"
matrix = [[1, 2, 3],
       [4, 5, 6],
       [7, 8, 9]]

#must set an emtpy matrix
new_matrix = Array.new(matrix.length) { Array.new(matrix[0].length) }

y = 0
while y < matrix.length
  x = 0
  while x < matrix[y].length
    new_matrix[x][y] = matrix[y][x] #reverse x and y
    x += 1
  end
  y += 1
end

p new_matrix



m = Matrix.rows([1, 2, 3], [4, 5, 6])

p m.inspect

# m = Matrix.build(2, 4) {|row, col| col - row }
#   => Matrix[[0, 1, 2, 3], [-1, 0, 1, 2]]
# m = Matrix.build(3) { rand }
#   => a 3x3 matrix with random elements
  
  

def hourglass(matrix)
    
    sums = []
    
    # iterate over the matrix
    
    y = 1
    while y <= matrix.length-2
        x = 1
        while x <= matrix[y].length-2
            sum = 0
            center = matrix[y][x]
            #top
            top = matrix[y-1][x-1..x+1].reduce(:+)
            #below
            bottom = matrix[y+1][x-1..x+1].reduce(:+)
            sum = center + top + bottom
            sums << sum
            x += 1
        end
        y += 1
    end
    # get all combinations in the hourglass format
    
    # get the sum of each of those hourglasses 
    
    # get the max 
    sums.max

end

############################
 Diagonal Difference
# Input Format
# Find the difference of the sums of the two diagonals in a matrix
# matrix = [
# [2,6,-12],
# [5,1,0],
# [-10,6,10]
# ]
# 2, 1, 10    sum 13
# -12, 1, -10  sum -21
# Output Format

# 0/-1     1/-2    2/-3


def diagonal_difference(matrix)
    # find first diagonal
    first = []
    i = 0
    j = matrix[i].length-1
    while i < matrix.length
        first << matrix[i][j]
        i += 1 #1
        j -= 1 #1 
    end
    
    sum1 = first.reduce(:+)
    # loop through array of array adjusting for subindex
    second = []
    k = 0
    while k < matrix.length
        second << matrix[k][k]
        k += 1
    end
    
    sum2 = second.reduce(:+)
    
    (sum1-sum2).abs
    
    
    # find second diagonal
    # get abs diff
end

#(13 - -21) 34
# Print the absolute difference between the two sums of the matrix's diagonals as a single integer.

# Sample Input

m = [
[11, 2, 4],
[4, 5, 6],
[10, 8, -12]
]

# Sample Output

p diagonal_difference(m)


#######################################################
  
      

jumble = [["U", "E", "W", "R", "T", "R", "B", "H", "C", "D"],
["C", "X", "G", "Z", "U", "W", "R", "Y", "E", "R"],
["R", "O", "C", "K", "S", "B", "A", "U", "C", "U"],
["S", "F", "K", "F", "M", "T", "Y", "S", "G", "E"],
["Y", "S", "O", "O", "U", "N", "M", "Z", "I", "M"],
["T", "C", "G", "P", "R", "T", "I", "D", "A", "N"],
["H", "Z", "G", "H", "Q", "G", "W", "T", "U", "V"],
["H", "Q", "M", "N", "D", "X", "Z", "B", "S", "T"],
["N", "T", "C", "L", "A", "T", "N", "B", "C", "E"],
["Y", "B", "U", "R", "P", "Z", "U", "X", "M", "S"]]

# dictionary = ["RUBY", "ROCKS", "DAN"]

# # write a function that takes in a matrix of jumbled letters and a dictionary and returns the location of words in:
# # [[word, start, finish], [word, start, finish]...] or similar format

# # input (matrix, dictionary) output ["RUBY", jumble[9][3], jumble[9][0]]


def word_search(matrix, dictionary)
    
    results = []
    
    dictionary.each do |word|
        first_char = word[0]
        i = 0
        while i < matrix.length
            j = 0
            while j < subarr.length
                if matrix[i][j] == first_char
                    combos = []
                    # check right
                    if word == matrix[i][j..j+word.length-1].join("")
                        results << [word, matrix[i][j], matrix[i][j+word.length-1]]
                    end
                    # check left
                    if word == matrix[i][j-word.length+1..j].reverse.join("")
                        results << [word, matrix[i][j], matrix[i][j-word.length+1]]
                    end
                    #down
                    down = []
                    (word.length).times do |idx|
                        down << matrix[i + idx][j]
                    end
                    if word == down.join("")
                        results << [word, matrix[i][j], matrix[i+word.length-1]
                    end
                    
                    up = []
                    (word.length).times do |idx|
                        up << matrix[i - idx][j]
                    end
                    if word ==  up.join("")
                        results << [word, matrix[i][j], matrix[i+word.length-1]
                    end
                end
                j += 1
            end
            i += 1
        end
    end         
                    
    results                
                
        
end


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

def get_repeat_combos(arr, num)
  
  all_elements = []
  arr.each do |el|
    num.times {all_elements << el}
  end
  
  combos = [[]]
  all_elements.each do |el|
    new_subsets = combos.map{|subarray| subarray + [el]}
    combos += new_subsets
  end
  
  combos.select {|subsets| subsets.length == num}

end

get_repeat_combos([1, 2, 3, 4, 5, 6], 3)
##################


  
def cat_hat(num)
    
    arr = (1..num).to_a
    cats = Hash.new
    arr.each{|num| cats[num] = false}
    
    
    i = 1
    while i < cats.size #walk through
        j = 1
        while j < cats.size #cat number
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

def divide_by(string)
  alphabet = ("a".."z").to_a
  # loop thru, if hit number, start another loop until not a number
  letters = string.split("")
  letter_count = 0
  numbers = []
  i = 0
  while i < letters.length
    char = letters[i]
    if alphabet.include?(char.downcase)
      letter_count += 1
      i += 1
    elsif char.to_i.to_s == char
      j = i+1
      while j < letters.length && letters[j] == letters[j].to_i.to_s
        j += 1
      end
      num = letters[i..j].join("").to_i
      numbers << num
      i = j
    else
      i += 1
    end
  end
  
  sum = numbers.reduce(:+)
  
  sum.fdiv(letter_count)
  
end


divide_by("33ab12c")

def my_sort(arr)
  
  i = 0
  while i < arr.length
    j = i + 1
    while j < arr.length
      if arr[i] > arr[j]
        arr[i], arr[j] = arr[j], arr[i] # HERE!!!!
      end
      
      j += 1
    end
    
    i += 1
  end
  
  return arr
end

my_sort([3, 3, 2, 5, 1, 7, 1, 4, 4, 2])



def anagram?(string1, string2)

    return true if string1.split("").sort == string2.split("").sort
    
    return false
    
end


def WaveSorting(arr)
  arr.each{|num| return false if arr.count(num) > (arr.length / 2.0) }
  true
end

p "pascals triangle"
def TriangleRow(num)
  
  sets = [[1], [1, 1]]
  until sets.length == num+1
    #run row creator
    sets << row_creator(sets[-1])
  end
  
  sets[-1].reduce(:+)
  
end



def row_creator(arr)
  
  new_set = [1]
  i = 0
  while i < arr.length-1
    sum = arr[i] + arr[i+1]
    new_set << sum
    i += 1
  end
  new_set << 1
  new_set
  
end


#zero_matrix(arr) write a fucntion that takes a 2D array and anytime a 0
#is encountered zeros out that whole row and column

#matrix = [
          #[1,2,3,4],
          #[1,2,3,0]
          ]
#zero_matrix(matrix) => [[1,2,3,0] ,[0,0,0,0]]

# matrix2 = [[1,2],
#           [1, 2, "f", 0],
#           [1, 2,  3,  4,  5]]
#zero_matrix(matrix2) => [[1,2], [0,0,0,0], [1,2,3,0,5]]



def zero_matrix(matrix)
    y = 0
    columns = []
    
    while y < matrix.length do
        x = 0
        while x < matrix[y].length do
            if matrix[y][x] == 0
                columns << x
                matrix[y].map!{ | el | el = 0}
            end                
            x += 1
        end
        y += 1
    end
    
    columns.each do |c|
       matrix = handle_columns(matrix, c)
    end 
    
    matrix
end

def handle_columns(m, col)

    i = 0
    while i < m.length
        if m[i].length-1 >= col
            m[i][col] = 0
        end
        i += 1
    end
    m 
end
