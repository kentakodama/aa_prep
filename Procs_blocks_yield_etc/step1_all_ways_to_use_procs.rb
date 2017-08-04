#THERE ARE EIGHT WAYS TO CALL A PROC
#nb the ampersand & converts blocks into procs (means to_proc)
##########################
#First way
#store a block in a variable (this is called a proc) and pass it as argument
arr = [2, 3, 4]
#example 1
cube = Proc.new{|x| x*x*x}

cubed_arr = arr.map(&cube) #ampersand indicates that the variable is being used as a proc

puts cubed_arr
#example 2
square = Proc.new {|num| num * num}
p [1, 2, 3].map &square

#########################################################
#Second way
#convert existing methods to symbols then to procs
#use existing methods
p ["a", "b", "c"].map(&:upcase)
p [1, 2, 3, 4].select(&:odd?)


########################################################
#Third way
#Convert extended methods to symbols then procs
#example 1
# step 1 create class extension
class Numeric
  def doubler
   self * 2
  end
end

#symbol refers to the method, & converts to proc
p [2, 3, 4].map(&:doubler)

##########################################
#Fourth way
#convert symbol to proc object and use call method on proc
# step 1 create class extension
class Numeric
  def doubler
   self * 2
  end
end
#******* can only convert to proc from a symbol
#step 2 create proc by converting symbol form of method with to_proc method
symbolic_proc = :doubler.to_proc
#step 3 call the proc with arguments
p symbolic_proc.call(12) #this way

#example 2

class String
  def funky_case
    results = ''
    i = 0
    while i < self.length
      results += self[i].downcase if i.even?
      results += self[i].upcase if i.odd?
      i += 1
    end
    results
  end
end


p "hello this is a sentence".funky_case
symbolic_proc = :funky_case.to_proc
p symbolic_proc.call('hello this a is a super sentence')

###################################################################
#Fifth way
#have the proc be the receiver of the call method and pass arguments in call method
greet = Proc.new {|name| "Hello, #{name}!"}
#single parameter
p greet.call('kenta') #must have a call method
#can do multiple people
people = ['Kenta', 'Elaine', 'Toshio']
people.each do |person|
  p greet.call(person)
end
##################################################################
#Sixth Way
#create a function that takes procs as arguments
def call_proc(&prc) #must have a ampersand (to_proc) method
  prc.call
end
call_proc { p "this calls the proc"} #this block is the proc

#create a function that takes multiple arguments including proc
#example 1
def caller(string, &prc)
  prc.call(string)
end

p caller("this is a test", &:funky_case)
#example 2
def call_doubler(num, &prc)
  prc.call(num)
end

p call_doubler(6, &:doubler)


############################################################
#Seventh way
# combining procs in a single method as multiple arguments
def math_equation(num, first_proc, second_proc, third_proc)

  val1 = first_proc.call(num)
  val2 = second_proc.call(val1)
  third_proc.call(val2)

end
subtract_32 = Proc.new {|num| num - 32}
times_5 = Proc.new {|num| num*5}
divide_9 = Proc.new {|num| num/9}


celsius = math_equation(212, subtract_32, times_5, divide_9)

p celsius

############################################################
#Eigth Way
# creating non-bang versions of class extensions
#step 1 create bang class extension
class Array
  def kenta_map!
    self.each_with_index do |el, i|
       self[i] = yield(el)
    end
    self
  end
end

arr = [1, 2, 3, 4]
#test
p arr.kenta_map! {|num| num * num}

p arr
#step 2 create non-bang version by duplicating
# then passing block as proc into new extension
class Array
  def kenta_map(&prc) #this is necessary
    self.dup.kenta_map!(&prc)#this is necessary
  end
end
#test
arr = [4, 5, 6, 7]
arr.kenta_map {|num| num*10}


################################
#four ways to call this proc
my_proc = Proc.new {|a| p "There are #{a} ways to call a proc"}

#.call method
my_proc.call(4)
#implicit .call method
my_proc.(4)

my_proc[4]

my_proc === 4
