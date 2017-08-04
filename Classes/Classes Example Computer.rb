class Computer
    
    @@users = {}
    
    def initialize(username, password)
        @username = username
        @password = password
        @files = {} # can create var thats an object
        @@users[username] = password # can create variables that are objects
    end
    
    def create(filename)
        time = Time.now
        @files[filename] = time
        puts "New file, #{filename}, created by #{@username} at #{time}"
    end
    
    def Computer.get_users
        return @@users
    end
end

my_computer = Computer.new("kkodama", "monster")

my_computer.create("Application")

var = Computer.get_users
puts var
