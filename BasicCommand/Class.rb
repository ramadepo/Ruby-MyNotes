puts
print "The Class test : \n\n"

class Vehicle
    attr_accessor :price
    @@count = 0
    CONST_VAR = "Constant"
    
    def initialize(price,size)
        @price,@size = price,size
        @@count += 1
    end

    def show
        puts @price
        puts @size
        puts @@count
        puts CONST_VAR
    end

    def get_size
        @size
    end
end

v = Vehicle.new(500,3)

v.show
puts

puts v.price
# puts v.size           this will make error
puts v.get_size
#puts Vehicle.count     this will make error
puts

puts Vehicle::CONST_VAR

puts
