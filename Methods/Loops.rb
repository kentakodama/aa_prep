
# All these do the same thing
# while loop
puts "WHILE LOOP"

i = 1
while i <= 5
    puts i
    i += 1
end

# until loop (conditional is outside the BLOCK)
puts "UNTIL LOOP"

i = 1
until i > 5
    puts i
    i += 1
end

# do loop (conditional is within the BLOCK)
puts "DO LOOP"

i = 1
loop do 
    puts i
    i += 1
    break if i > 5
end

# for loop
puts "FOR LOOP"

for num in 1..5
    puts num
end

# Even conditional
puts "JUST ODD NUM"

for num in 1..5
    puts num if num.odd?
end

# NEXT keyword
puts "JUST ODD NUM but with NEXT keyword"

for num in 1..5
    next if num.even?
    puts num
end






