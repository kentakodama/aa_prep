p "Adding new methods to existing classes like array"
p "Use class_eval keyword"
p "Interesting: there doesnt have to be a stand in object to call methods like reduce or length"
p "! Bang method is a separate method than the original. must define twice"

Array.class_eval do
    def sum
        if length == 0
            0
        else
            reduce(:+)
        end
    end
    
    def square
        if length == 0
            []
        else
            map {|i| i*i}
        end
    end
    
    def square!
        if length == 0
            []
        else
            map! {|i| i*i}
        end
    end
        
end

arr = [2, 3, 5, 6]
array = [1,2,3]
p array.square!
p arr.sum.inspect
p arr.square.inspect
