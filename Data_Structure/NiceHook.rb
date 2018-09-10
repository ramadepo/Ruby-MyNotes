################################### Resource ###################################
# class Career
#   attr_reader :hp, :mp, :power, :strength
#   def initialize(args)
#     @hp, @mp, @power = args[:hp], args[:mp], args[:power]
#     @strength = hp + mp + power
#   end
# end

# class Warrior < Career
#   attr_reader :anger
#   def initialize(args)
#     super(args)
#     @anger = args[:anger]    
#   end
# end

# class Assassin < Career
#   attr_reader :speed
#   def initialize(args)
#     super(args)
#     @speed = args[:speed]
#   end
# end

# puts
# ########output########
# warriror = Warrior.new(hp:300 , mp:50, power: 100, anger: 100)
# p warriror
# assassin = Assassin.new(hp: 200, mp: 200, power: 50, speed: 25)
# p assassin
# ########output########
# puts


################################### Bad Resource ###################################
# class Career
#   attr_reader :hp, :mp, :power, :strength, :ratio
#   def initialize(args)
#     @hp, @mp, @power = args[:hp], args[:mp], args[:power]
#     @strength = (hp + mp + power) * ratio
#   end
# end

# class Warrior < Career
#   attr_reader :anger
#   def initialize(args)
#     @anger = args[:anger]
#     @ratio = anger * 0.015
#     super(args)    
#   end
# end

# class Assassin < Career
#   attr_reader :speed
#   def initialize(args)
#     @speed = args[:speed]
#     @ratio = speed * 0.06
#     super(args)
#   end
# end

# puts
# ########output########
# warriror = Warrior.new(hp:300 , mp:50, power: 100, anger: 100)
# p warriror
# assassin = Assassin.new(hp: 200, mp: 200, power: 50, speed: 25)
# p assassin
# ########output########
# puts


# ################################## Nice Hook ###################################
# class Career
#     attr_reader :hp, :mp, :power, :strength, :ratio
#     def initialize(args)
#       local_initialize(args)
#       @hp, @mp, @power = args[:hp], args[:mp], args[:power]
#       @strength = (hp + mp + power) * ratio
#     end
#   end
  
#   class Warrior < Career
#     attr_reader :anger
#     def local_initialize(args)
#       @anger = args[:anger] 
#       @ratio = anger * 0.015   
#     end
#   end
  
#   class Assassin < Career
#     attr_reader :speed
#     def local_initialize(args)
#       @speed = args[:speed]
#       @ratio = speed * 0.06
#     end
#   end
  
#   puts
#   ########output########
#   warriror = Warrior.new(hp:300 , mp:50, power: 100, anger: 100)
#   p warriror
#   assassin = Assassin.new(hp: 200, mp: 200, power: 50, speed: 25)
#   p assassin
#   ########output########
#   puts