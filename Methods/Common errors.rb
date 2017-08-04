p "Common Error reasons"

# one
if +/-/* doesnt work usually its because its not a number. 
    convert FROM string

#two
arr.pop.join("") ## doesnt work because join is refering to the popped element
#must be separate
arr.pop
arr.join("")


#three 
separating integers that are in string form from other char
 if char.to_i.to_s == char
     char is a number!!!!!
     
 "string".to_i => becomes 0 always

#four 

# cant use each/each_with_index on a string be careful

words.each do |word|   #cano only select when array
        just_vowels = word.split("").select{|char| vowels.include?(char)}
        
#### CANT DO EACH ON A STRING!!!!!

p "DO NOT try to escape loop with counter reset do it like below with a conditional"
def NearestSmallerValues(arr)

    # results array
    results = []
    # loop forward
    i = 0
    while i < arr.length
  
        if arr[0..i].any? {|num| num < arr[i]}
    "here"  found = false # use this for the conditional below
            j = i-1
            while j >= 0 && !found #this is the smart way, dont use counter reset to escape
                if arr[j] < arr[i]
                    results << arr[j]
                    found = true
                end
                j -= 1
            end
        else
            results << -1
        end
        i += 1
    end
    
    results.join(" ")
   
end
