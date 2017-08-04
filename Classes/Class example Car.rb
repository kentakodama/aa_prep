class Car
    def initialize(make, model)
        @make = make
        @model = model
        @speed = 0
        @gas = 10
    end

    def accelerate
        @speed += 19
        puts "You sped up to #{@speed} MPH!"
        if @speed > 60
            over_speed_limit
        end
        passage_of_time
    end

    def brake
        @speed = 0
        puts "Hey you've stopped moving!"
    end

    def tap_brake
        @speed -= 10
        puts "You slowed down to #{@speed} MPH!"
    end

    def fuel?
        puts "You have #{@gas} gallons left"
    end

    def refuel
        @gas = 10
        puts "You now have a full tank of gas!"
    end

    private
    #gas station

    def passage_of_time
        @gas -= 1
        if @gas.between?(1, 3)
            puts "You are running out of gas!"
        elsif @gas == 0
            puts "You are out of gas. YOU FUCKED NOW SON"
        end
    end

    def over_speed_limit
        puts "Hey you are going over the speed limit! Slow down!"
    end
end

my_car = Car.new("Toyota", "Prius")

my_car.accelerate
my_car.accelerate
my_car.accelerate
my_car.accelerate
my_car.accelerate
my_car.accelerate
my_car.fuel?
my_car.tap_brake
my_car.tap_brake
my_car.tap_brake
my_car.tap_brake
my_car.tap_brake
my_car.tap_brake
my_car.brake
my_car.accelerate
my_car.fuel?
my_car.refuel
