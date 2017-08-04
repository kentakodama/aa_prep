

time = Time.new
puts time

bday = Time.new(1987, 12, 30, 1, 38)
puts bday

bday2 = Time.mktime(1987, 12, 30, 1, 38)
puts bday2

years = (time - bday) / (60*60*24*365)
puts years