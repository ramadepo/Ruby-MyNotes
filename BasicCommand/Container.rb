puts

#initial with member
print "initial with member : \n\n"

friends = Array[3,2,1,4,6,5]

for i in 0..friends.length() do
    print friends[i]
    print " "
end
puts
puts

#sort & reverse
print "sort & reverse\n\n"
friends = Array[3,2,1,4,6,5]
print friends.sort()[1,4].to_s + "\n"
p friends
puts
print friends.sort().reverse().to_s + "\n"
p friends
puts

print "initial with none : \n\n"
a = Array.new   #initial with none
a[0] = 0
a[5] = [1,2,3]
a[6] = "five"
p a
puts a[-1]



puts