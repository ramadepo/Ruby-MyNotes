#yield
puts

#pass the parameter
print "You can even pass the parameter to the block from yield\n\n"

def test1
    yield 5,6
    puts "---------------------"
    yield 4,4
    puts
end

test1{
    |i,j|
    puts i+j
}

#{...}
print "use {} to cluster the code\n\n"
[1,2,3,4,5].each{
    |i|
    puts i
}
puts

#do ... end
print "use do & end to cluster the code\n\n"
[1,2,3,4,5].each do |i|
    puts i
end
puts

print "Block local variable test:\n\n"

x = 5
3.times{
    |i;x|
    x = i
    puts "in the block x is " + x.to_s
}
puts "outside x is " + x.to_s
puts 