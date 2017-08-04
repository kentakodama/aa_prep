
i_like = Proc.new {puts "I like things"}

i_like.call

i_like = Proc.new {|thing| puts "I like #{thing}."}

i_like.call("chocolate")

double = Proc.new { puts "Lets double a num, but no argument"}
double.call

double = Proc.new {|number| puts number*2}

double.call(2) # for a single method

arr = [1, 2, 3]
arr.each(&double) # proc as a argument, passing each element into arg of proc
# the argument for the proc is provided by the outer method EACH


def greeter(some_proc)
    some_proc.call
end

hello_espanol = Proc.new {puts "Hola"}

greeter(hello_espanol)
##############################################

hello_espanol = Proc.new {|n| puts "hola, #{n}."}

def greeter(name, some_proc)
    some_proc.call(name)
end

greeter("Kenta", hello_espanol)


###############################


add = Proc.new {|first, second| puts first + second}

multiply = Proc.new {|first, second| puts first * second}

power_of = Proc.new {|first, second| puts first**second}

def calculator(operation, num1, num2)
    operation.call(num1, num2)
end

calculator(add, 1, 3)
calculator(multiply, 4, 5)
calculator(power_of, 3, 3)


###############################
puts "Returning procs in methods// callbacks"

def two_procs(first_proc, second_proc)
    Proc.new do |x|
        second_proc.call(first_proc.call(x))
    end
end


triple = Proc.new {|num| num*3}
square = Proc.new {|num| num*num}
double = Proc.new {|num| num*2}
add_two = Proc.new {|num| num + 2}

triple_then_square = two_procs(triple, square)
add_two_then_double = two_procs(add_two, double)

puts triple_then_square.call(3)
puts add_two_then_double.call(4)

puts triple.call(3)


########

class Array

  def my_select!(&prc)
    results = []
    self.each do |el|
      results << el if prc.call(el)
    end
    results
  end

end


class Fixnum

  def prime?
    return false if self <= 1
    return true if self == 2

    i = 2
    while i < self
      return false if self % i == 0
      i += 1
    end

    true
  end
end
#this works fine as expected 
arr.my_select!(&:prime?)
