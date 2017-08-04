def measure(n=1) #take in array as arguments?
    start = Time.now
    n.times {yield}
    finish = Time.now
    (finish - start)/n
end
