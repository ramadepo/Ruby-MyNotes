puts

# class SnowPlayer
#   def initialize(name, snow_count)
#     @snow_count = snow_count
#   end
#   def shoot(size)
#     puts "prepare the snow (#{size})"
#     @snow_count -= size
#     puts "throw the snow ball (#{size})"
#   end
# end

# player1 = SnowPlayer.new("player1", 1000)

# player1.shoot(10)  
# => prepare the snow ball (10)
# => throw the snow ball (10)

class SnowPlayer
  def initialize(name, snow_count)
    @snow_count = snow_count
  end
  def shoot(size)
    puts "prepare the snow (#{size})"
    @snow_count -= size
    puts "throw the snow ball (#{size})"
  end
  def make_snowman(size)
    puts "prepare the snow (#{size})"
    @snow_count -= size
    puts "make a snowman (#{size})"
  end
end

player1 = SnowPlayer.new("player1", 1000)

player1.make_snowman(10)


puts


