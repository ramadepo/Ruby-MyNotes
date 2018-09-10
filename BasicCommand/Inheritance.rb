puts
#print "Inheritance test : \n\n"

class Animal
    
    def initialize(life)
        @life = life
    end

    def get_life
        puts @life.to_s + " years"
    end

end

class Fish < Animal
    
    def initialize(life, breathe)
        super(life)
        @breathe = breathe
    end

    def get_breathe
        @breathe
    end

end

fish = Fish.new(10,"water")
puts fish.get_life
puts fish.get_breathe

puts