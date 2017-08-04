puts "Modules- Containers with methods and constants"
# like Classes, but no var just constants, and no instances or subclasses


puts "Module syntax"

module Circle
    
    PI = 3.14 # CONSTANT ALWAYS FULL CAPS
    
    def Circle.area(radius)
        PI * radius**2
    end
    
    def Circle.circumference(radius)
        PI * radius * 2
    end
end

puts "Using methods within a module. MUST HAVE (Module.method)"
circle_area = Circle.area(2)
puts circle_area

puts "Accessing constants within a module (Module::CONSTANT)"
puts "This means PI in module Circle"
puts Circle::PI

puts "Different from PI in other modules for example..."

puts Math::PI

#############################################

puts "Adding other pre-written modules"
# the Math module already exists in the interpreter, but some other
# pre-written modules dont so we have to "bring them into interpreter"


require "date"

#now we can use the Date module

puts Date.today


###################################################
puts "Mixins: putting modules within classes"

## Step 1: create Circle module again/or have a pre-written one ready
#done above (cant do again here or fucks up)
## Step 2: create a class and "include Circle"

class Yoyo
    
    attr_reader :area
    attr_reader :weight
    attr_reader :company
    attr_reader :radius
    attr_reader :model
    
    include Circle ############## use include to nest Circle in Yoyo class
    
    def initialize(company, model, radius)
        @company = company
        @model = model
        @radius = radius
        @area = Circle.area(@radius) ###### Now Yoyo class can use Circle module
        @weight = @area * 1.5
    end
    
    def get_weight
        puts "You're #{@company} #{@model} is #{weight} grams."
    end
    
end
    
my_fav_yoyo = Yoyo.new("Duncan", "Butterfly", 3)

my_fav_yoyo.get_weight

#################################
puts "More examples of Mixins"

### step 1, create module

module Action
    def jump
        @distance = rand(4) + 2
        puts "I jumped #{@distance} feet."
    end
    
    def attack
        @killed = rand(2) + 1
        puts "I killed #{@killed} enemies today."
    end
end

### step 2, include module in a new class

class Rabbit
    
    include Action
    
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

### step 3, use modules method on instance of Rabbit class

peter = Rabbit.new("Peter")
peter.jump
peter.attack

    

