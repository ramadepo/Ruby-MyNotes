#if-elsif-else
print "if-elsif-else : \n\n"

if 3>5
    puts "bug"
elsif 3>4
    puts "bug"
else
    puts "good"
end

puts "in one line" if true  #=> in one line

puts

#case-when-else
print "case-when-else : \n\n"

case "match case"
when "case match"
    puts "bug"
when "match the case"
    puts "bug"
when "match case"
    puts "good"
else
    puts "bug"
end

puts

#special operator
print "Special operator : 平行指派\n\n"

a,b,c = 11,22,33
puts a
puts b
puts c

puts

#unless-else
print "invert if : unless-else\n\n"
unless  5>3
    puts "bug"
else
    puts "good"
end

puts

