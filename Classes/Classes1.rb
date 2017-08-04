puts "Lesson 1, syntax of a class"
class Person
    #below is an class variable
    #must initialize it too
    @@person_number = 0

    def initialize(name)
        @name = name
        puts "You have created #{@name}."
        @@person_number += 1
    end

    def set_age(age) # this is an instance method
        @age = age
    end

    def get_age # this is an instance method
        puts "#{@name} is #{@age}!"
    end

    def self.number_of_instance # this is a Class method.
        puts "There are #{@@person_number} people!"
    end
end

# above is the prototype
####################################################################
puts "Lesson 2, below are ways to create instances from the class"
# We can create new instances of Person
me = Person.new("Kenta")

# and use methods that are internal to the Class
me.set_age(29)
me.get_age

#another instance of Person class
mom = Person.new("Elaine")
mom.set_age(69)
mom.get_age

friend = Person.new("Perry")

Person.number_of_instance

################################################
puts "Lesson 3"
puts "using attributes"
# attributes allow us to assign and change instance variables like name
# without having to create a method ourselves. automatic

# old way
class Person
    def initialize(name, age, job)
        @name = name
        @age = age
        @job = job
    end

    def name
        @name
    end

    def age
        @age
    end

    def job
        @job
    end
end

# new way with attributes, much more compact
class Person
    #the symbols below refer to methods (like we did with procs)
    attr_reader :name # reader can only read - things that dont change
    attr_writer :age #writer can only write -
    attr_accessor :job #accessor can do both

    def initialize(name)
        @name = name
        @age
        @job
    end
end

#instance creation

me = Person.new("Kenta")

# read name
puts me.name

# set age
me.age = 29

# sets and reads job
me.job = "coder"
puts me.job


###################################
puts "Lesson 4, another example with Dice"

class Die
    def roll
        return rand(6)+1
    end

end

dice = [Die.new, Die.new]

dice.each {|die| puts die.roll}


puts "Lesson 5, using and accessing public and private methods"
puts "useful for bank accounts"

class Bank_account

    attr_reader :name
    attr_writer :balance

    public

    def initialize(name, balance=100)
        @name = name
        @balance = balance
    end

    def check_balance(pin_number)
        if pin_number == pin #notice this (pin) is not a var, refers to the private method
            puts "Hello #{@name}. You're balance is $#{@balance}."
        else
            pin_error #notice this conditional calls a private method
        end
    end

    private

    def pin
        @pin = 1234
    end

    def pin_error
        puts "Sorry, wrong pin number"
    end

end

savings = Bank_account.new("Kenta")

savings.check_balance(1222) #doesnt match pin
savings.check_balance(1234) #matches pin, so gets balance
