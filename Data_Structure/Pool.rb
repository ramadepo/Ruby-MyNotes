require 'get_process_mem'
require 'benchmark'

class Hero
  attr_reader :power, :ability
  def initialize(power, ability)
    @power = power
    @ability = ability
  end
end
class Hero1 < Hero
  def initialize
    super(100, "強化型")
  end
end
class Hero2 < Hero
  def initialize
    super(50, "元素型")
  end
end


class Union
  def initialize
    @hero_pool = Hash.new
    @pool_size = Hash.new
  end
  def add_hero_type(type, size)
    @hero_pool[type] = Array.new
    @pool_size[type] = size
    size.times do
      @hero_pool[type].push(type.new)
    end
  end
  def allocate(type)
    if @hero_pool[type].length == 0
      puts "No Hero Now"
      return
    end
    @hero_pool[type].shift
  end
  def recycle(type, hero)
    if @hero_pool[type].length < @pool_size[type]
      @hero_pool[type].push(hero)
    else
      puts "#{type} is Enough"
    end
  end
  def self.instance
    @@instance
  end
  @@instance = Union.new
  private_class_method :new
end

################## output ##################
puts

Union.instance.add_hero_type(Hero1, 10)
Union.instance.add_hero_type(Hero2, 5)
hero1 = Union.instance.allocate(Hero1)
Union.instance.recycle(Hero1, hero1)

puts
################## output ##################
GC.start
mem = GetProcessMem.new
p mem