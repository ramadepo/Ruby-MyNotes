puts

# class SnowShooter
#   attr_reader :name,:supporter
#   def initialize(name, supporter)
#     @name = name
#     @supporter = supporter
#   end
#   def shoot_ball(size)
#     puts "#{name} throw the snow ball (#{supporter.snowball(size)})"
#   end
#   def shoot_triangle(size)
#     puts "#{name} throw the snow triangle (#{supporter.snowtriangle(size)})"
#   end
# end

# class SnowSupport
#   attr_reader :collect
#   def initialize(collect)
#     @collect = collect
#   end
#   def snowball(size)
#     @collect -= size
#     puts "support the snowball (#{size})(#{collect})"
#     size
#   end
#   def snowtriangle(size)
#     @collect -= size
#     puts "support the snowtriangle (#{size})(#{collect})"
#     size
#   end 
# end

#   player1 = SnowShooter.new("player1",SnowSupport.new(1000))
#   player1.shoot_ball(50)  #=> support the sn...
#   player1.shoot_triangle(50)  #=> support the sn...


  class SnowShooter
    attr_reader :name
    def initialize(name)
      @name = name
    end
    def shoot(shape,size)
      puts "#{name} throw the snow #{shape} (#{size})"
    end
  end
  
  class SnowSupport
    attr_reader :collect, :shooter
    def initialize(collect,shooter)
      @collect = collect
      @shooter = shooter
    end
    def snowball(size)
      @collect -= size
      puts "support the snowball (#{size})(#{collect})"
      shooter.shoot("ball", size)
    end
    def snowtriangle(size)
      @collect -= size
      puts "support the snowtriangle (#{size})(#{collect})"
      shooter.shoot("triangle", size)
    end 
  end
  
  support1 = SnowSupport.new(1000, SnowShooter.new("player1"))
  support1.snowball(20)  #=> support the sn...
  support1.snowtriangle(20)  #=> support the sn...

  puts