#use load, the library may be loaded for many times
#use require, the library will only be loaded once
puts
print "Module test : \n\n"



require_relative "ModuleFile.rb"
class Mathematician
    include Math_func
    def initialize(r)
        @r = r
    end
    def show
        puts circle_length(@r)
        #puts Mathematician.circle_length(@r)   #error
    end
end

class Phiysicist
    extend Math_func
    def initialize(r)
        @r = r
    end
    def show
        #puts circle_length(@r)                 #error
        puts Phiysicist.circle_length(@r)
    end
end

mn = Mathematician.new(5)
pq = Phiysicist.new(5)

mn.show
pq.show
p Mathematician.ancestors
p Phiysicist.ancestors



puts