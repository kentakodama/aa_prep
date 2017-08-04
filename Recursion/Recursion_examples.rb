
RECURSION


p 'base case is a condition that tells recursion to stop'

#this wont stop , infinite loop
def print_hello
  p 'hello'
  print_hello
end


def print_hello(num)
  p 'hello'
  if num > 0
    print_hello(num -1)
  end
end

#example 2 with factorial


#5! factorial is really just 5 times 4! which is really 4 times 3!

def fac(num)
  return 1 if num == 1
  num * fac(num-1)
end

def fib(nth)
  return 1 if nth == 1
  return 1 if nth == 2
  fib(nth-2) + fib(nth-1)
end

p fib(6)

#the above is not a good example to use recursion


def move_tower(height, source, destination, spare)
  if height == 1
    move(source, destination)
  else
    move_tower(height-1, source, spare, destination)
    move(rource, destination)
    move_tower(height-1, spare, destination, source)
  end
end


#how to solve with recursion: create a basecase, then breakdown the steps

  def my_flatten
    results = []
    (0..self.length-1).each do |i|
      if self[i].class == Array
        results += self[i].my_flatten
      else
        results << self[i]
      end
    end
    results
  end


def perms(digits)
  return (0..9).map {|num| [num] } if digits == 1
  results = []
  perms(digits - 1).each do |sub_perm|
    results += (0..9).map do |num|
      sub_perm + [num]
    end
  end
  results
end

perms(2).map{|perm| perm.join}


#first week
#1 Enumerables including procs and blocks
#oop classes
#recursion
#minesweeper
#tic tac toe Ai
