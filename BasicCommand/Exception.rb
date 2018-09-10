#begin-rescue...-else-ensure-end
#raise : force to have a exception
puts

#Exception Test
print "10/x, please input the value of x : \n\n"
i = gets.chomp
puts 
begin
    10/i.to_i
    raise "force to have a exception"
rescue Exception => e
    puts "Here is the Error Message : " + e.message
    puts "Where does the Error occur : " + e.backtrace.inspect
else
    puts "Input OK"
ensure
    puts "Must be executed part"
end

puts

#basic
print "basic handler\n\n"
i = gets.chomp
begin
    10/i.to_i
rescue Exception => e
    puts e.message
end
puts