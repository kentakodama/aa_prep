#block given method?
def try
  if block_given?
    yield
  else
    "no block given"
  end
end

p try
p try {"Hello"}

def greet
    puts "Hello"
    yield
    puts "Hello"
end

greet {puts "Hola"}

def greet(name)
    puts "Hello"
    yield(name)
    puts "Hello"
end

greet("Kenta") {|n| puts "Hello, #{n}" }

# using yield practically
# yield is used to create new methods that can run a block
# step 1, this yield says do the same thing to each element in the array
class Array
    def same_as_map
        self.each_with_index do |element, index|
            self[index] = yield(element)
        end
    end
end
arr = [2, 3, 4]

# step 2, the code block is passed the element argument
arr_squared = arr.same_as_map {|num| num**2 }

puts arr_squared.inspect

#tutoring
# passing blocks/procs in as arguments, must use call to return inside

#both examples work the same
def reverser(&block)
    string = block.call #tricky review, when called returns a string, which is stored in var string
    words = string.split(" ")
    words.map! {|word| word.reverse}
    words.join(" ")
end

def reverser
  yield.split(' ').map { |word| word.reverse  }.join(' ')
end
#########################################
#both examples work the same
def adder(add=1, &block)
    num = block.call
    num + add
end

def adder(default=1)
  default + yield
end
#########################################
#both examples work the same
def repeater(n=1, &block)
    n.times {block.call}
end

def repeater(num=1)
  num.times {yield}
end

#########################################


#this is a simple way to pass custom args to a block
def eval_block(*args, &block)
  yield(args)
end


p eval_block(1, 2, 3, 4) {|nums| nums.reduce(:+)}


# determines time it took to run a block of code n times
def measure(n=1)
    start = Time.now
    n.times {yield}
    finish = Time.now
    finish - start
end
