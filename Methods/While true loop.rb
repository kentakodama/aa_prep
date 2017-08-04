p "while TRUE, use when you want to find prime or multiple or factor "

def NextPalindrome(num)
    
    i = num
    while true
        i += 1
        if palindrome?(i)
            return i
        end
    end
         
end


def palindrome?(num)
    str = num.to_s
    if str == str.reverse
        true
    else
        false
    end
end

#############################

def nth_prime(num)
    
    nth_number = 0
    i = 2
    while true
        if prime?(i)
            nth_number += 1
            if nth_number == num
                return i
            end
        end
        i += 1
    end
            
end
    
def prime?(num)
    
    if num == 2
        true
    end
    
    i = 2
    while(i < num)
        if (num % i == 0)
            return false
        end
        i += 1
    end
    
    return true
    
end

answer = nth_prime(5)
p answer

###########################

def next_power_of_2(num)
    
    i = num
    while true
        i += 1
        if multiple_of_two(i)
            return i
        end
    end
end

def multiple_of_two(num)
    
    i = 1
    while i < num
        i *= 2
        if i == num
            return true
        end
    end
    
    return false
end

p next_power_of_2(5)



