puts

class SnowShooter
  attr_reader :name,:supporter
  def initialize(name, supporter)
    @name = name
    @supporter = supporter
  end
  def shoot(size)
    puts "#{name} throw the snow ball (#{supporter.snowball(size)})"
  end
end

class SnowSupport
  attr_reader :collect
  def initialize(collect)
    @collect = collect
  end
  def snowball(size)
    @collect -= size
    puts "support the snowball (#{size})(#{collect})"
    size
  end 
end

  player1 = SnowShooter.new("player1",SnowSupport.new(1000))
  player1.shoot(50)  #=> support the sn...
  player1.shoot(50)  #=> support the sn...

  puts