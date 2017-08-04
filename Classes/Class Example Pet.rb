class Cat
    def initialize(name)
        @name = name
        @age = 0
        @stomach = 10
        @birthday = Time.new
    end
    
    def age
        puts "#{@name} is #{@age} years old."
        current_time
        passage_of_time
    end
    
    def feed
        @stomach = 10
        puts "Meow, I'm full!"
        current_time
        passage_of_time
    end
    
    def mood
        puts "I'm great!"
        current_time
        passage_of_time
    end
    
    
    private
    
    def passage_of_time
        @stomach -= 2
        if @stomach < 4
            hungry
        end
        @age += 1
    end
    
    def current_time
        @now = Time.new
        if @now - @birthday > 60
            passage_of_time
        end
    end
    
    def hungry
        puts "Meow, I'm hungry!!"
    end
    
end
    
pet = Cat.new("Das Kitty")
pet.mood
pet.age
pet.mood
pet.mood
pet.mood
pet.feed
pet.mood
pet.mood
pet.mood
pet.mood
pet.mood
pet.mood
pet.mood
pet.age

   
 
    
    
    
    
    
    
    
    
    
    