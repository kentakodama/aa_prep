
#this is a closure
def multiple_generator(m)
  lambda do |n|
    n * m
  end
end

doubler = multiple_generator(2)
tripler = multiple_generator(3)

p doubler.call(5)
p tripler.call(6)
