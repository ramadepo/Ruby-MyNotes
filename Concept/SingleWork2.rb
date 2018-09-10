puts

# class SnowPlayer
#   def initialize(name, snow_count)
#     @snow_count = snow_count
#   end
#   def prepare(size)
#     puts "prepare the snow (#{size})"
#     @snow_count -= size
#     size
#   end
#   def shoot(size)
#     puts "throw the snow ball (#{prepare(size)})"
#   end
# end

# player1 = SnowPlayer.new("player1", 1000)

# player1.shoot(10)
#=> prepare the snow ball (10)
#=> throw the snow ball (10)

class SnowPlayer
  def initialize(name, snow_count)
    @snow_count = snow_count
  end
  def prepare(size)
    puts "prepare the snow (#{size})"
    @snow_count -= size
    size
  end
  def shoot(size)
    puts "throw the snow ball (#{prepare(size)})"
  end
  def make_snowman(size)
    puts "make a snowman (#{prepare(size)})"
  end
end

player1 = SnowPlayer.new("player1", 1000)

player1.make_snowman(10)



puts