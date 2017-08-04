
# Following three class extensions do the same thing

#using yield to pass arguments to blocks
class Array
  def iterate
    self.each_with_index do |n, i|
      self[i] = yield(n)
    end
  self
  end
end

arr = [1, 2, 3, 4]
p arr.iterate! {|n| n*n}

#passing the method a proc converted from a block (must use &)
class Array
  def iterate(&code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
    self
  end
end

arr = [1, 2, 3, 4]
p arr.iterate! {|n| n*n}

#passing the method an original proc (no need for to_proc conversion)
class Array
  def iterate(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
    self
  end
end

square = Proc.new {|n| n*n}
arr = [1, 2, 3, 4]
p arr.iterate(square)
