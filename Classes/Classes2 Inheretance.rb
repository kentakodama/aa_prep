

class Mammal
    
    attr_reader :name
    attr_accessor :age
    attr_accessor :habitat
    attr_reader :hair
    attr_accessor :hair_level
    attr_accessor :mating_season
    
    def initialize(name)
        @name = name
        @age
        @habitat 
        @hair = true
        @hair_level
        @mating_season
    end
    
    def breed
        puts "lets make some babies"
    end
        
end

# create a monkey class from mammal class, exact copy, one-line syntax ok
class Monkey < Mammal; end

# create monkey class instance
monkey = Monkey.new("Curious George")

# monkey instance now has access to everything in mammal class

puts monkey.name
puts monkey.hair

monkey.hair_level = 10
puts monkey.hair_level

monkey.breed
#######################################################
puts "Overriding parent class methods"
# we can also override the parent class's methods with subclass methods
# example

class Human < Mammal
    def breed
        puts "Yeah we gonna fuck tonight son!"
    end
end

person = Human.new("Kenta")

person.breed

puts "adding methods to subclass"

class Neanderthal < Mammal
    
    attr_accessor :weapon
    
    def weapon
        @weapon
    end
end

neanderthal_dude = Neanderthal.new("Utzi")
neanderthal_dude.weapon = "Big stick"

puts neanderthal_dude.weapon






