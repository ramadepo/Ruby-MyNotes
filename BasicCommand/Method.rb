#the last statement is also the value to return
puts

def wow
    puts "wowwow"
end

def return_method(a)
    a
end

def add_method(a = 10,b = 20)
    a+b
end

x = 1
y = 2

wow
puts return_method(x)
puts add_method()
puts add_method(x,y)
puts