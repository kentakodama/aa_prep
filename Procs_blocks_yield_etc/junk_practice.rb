c_to_f = Proc.new {|c| c * (5.0/9.0) + 32}

temperatures = [3, 12, 4, 54, 30, 25]

temperatures.each do |temp|
  f = c_to_f.call(temp).round(1)
  p "#{temp}C is #{f}F"
end

class Array

  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_map!
    self.each_index do |i|
      self[i] = yield(self[i])
    end
    self
  end

  def my_map(&prc)
    duplicate = self.dup
    duplicate.my_map!(&prc)
  end

end


new_array = [2, 3, 5, 56].my_each {|num| p (num + 44)}
p new_array
