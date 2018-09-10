
puts



#while
print "while : \n\n"
i = 1
while i < 3
    puts i
    i+=1
end
puts

#until
print "invert while : until\n\n"
i = 2
until i>4
    puts i
    i+=1
end
puts

#for
print "for : \n\n"
i = 3
for i in 0..10
    puts i
    if i<3
        next
    elsif i>4
        break
    end
end
puts

#each
print "loop for collection : \n\n"
i = Array[1,2,3]
i.each do |j|
    puts j
end
puts

#loop{}
print "loop loop loop\n\n"
i = 4
loop{
    puts i
    i += 1
    if i > 6
        break
    end
}
puts