=begin
    4 type of variable :
        1. Number
        2. String
        3. Range
        4. Regular Expression
=end
puts

# Number & String (12345 & 'abcde'|"abcde")
print "Here's Number & String part : \n\n"

3.times{
    puts 'loop 3 times'
}

puts

a = 5

a.times{
    puts "loop #{a} times"
}

puts

#Range (?..?)
print "Here's Range part : \n\n"

a = 0..9        # a is 0~9
if a.include?(5)
    puts "5 is contained in Range a"
end

puts

b = 5

puts case b
when 0..3 then "Is 0~3"
when 4...5 then "Is 4"
when 5...6 then "Is 5"
when 6..10 then "Is 6~10"
end

puts

# Regular Expression (/ rule /)
print "Here's Regular Expression part\n\n"

c1 = /[0-9]/
c2 = /[1-9][0-9]/
c3 = /1[0-9]{2}/
c4 = /2[0-4][0-9]/
c5 = /25[0-5]/
clip = /#{c1}|#{c2}|#{c3}|#{c4}|#{c5}/
ip = /^#{clip}\.#{clip}\.#{clip}\.#{clip}$/

if  ip.match("192.168.1.1")
    puts "IP Correct"
end

puts