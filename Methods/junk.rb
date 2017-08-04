def prime?(num)
    
    return true if num == 2
    return false if num <= 1
    
    i = 2
    while i < num
        return false if num % i == 0
        i += 1
    end
    
    true

end

def nth_prime(nth)
   
   primes = []
   i = 2
   until primes.length == nth
        primes << i if prime?(i)
        i += 1
   end
    
    primes.last 
    
end

p nth_prime(10000)
