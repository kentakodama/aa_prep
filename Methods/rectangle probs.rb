#find area of a rectangle with given coordinates
def RectangleArea(strArr)

    coordinates = get_subarrays(strArr)
    x_values = []
    y_values = []

    #x first
    i = 0
    while i < coordinates.length
        x_values << coordinates[i][0]
        i += 1
    end


    j = 0
    while j < coordinates.length
        y_values << coordinates[j][1]
        j += 1
    end

    p y_values

    p x_values.max
    x_length = x_values.max - x_values.min
    y_length = y_values.max - y_values.min
    p x_length
    x_length * y_length
    #need the min x and max x
    # need the min y and max y
    #with subtraction get y and x lengths and multiply


end


#get subarrays of nums
#"(1 1)","(1 3)","(3 1)","(3 3)"

def get_subarrays(arr)

    #delete all parenthases
    arr.map!{|str| str.delete("(")} #"3 1"
    arr.map!{|str| str.delete(")")}
    arr.map! do |subarray|
        subarray.split(" ").map!{|string| string.to_i}
    end

    return arr

end

p get_subarrays(["(1 1)","(1 3)","(3 1)","(3 3)"])
p RectangleArea(["(1 1)","(1 3)","(3 1)","(3 3)"])



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
