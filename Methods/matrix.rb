p "matrix problems"
p "spiral"

m = [[1, 2, 3, 4],
     [5, 6, 7, 8],
     [9, 10, 11, 12],
     [13, 14, 15, 16]]
          
def spiral(matrix)
  #be careful for order of defining variables
  # becareful to do length minus one
  y_min = 0
  y_max = matrix.length-1
  x_min = 0
  x_max = matrix[0].length-1
  
  results = []
  while y_min <= y_max && x_min <= x_max
    
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
                    count -= 1
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
new_matrix = Array.new(matrix.length) { Array.new(matrix.length) }

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