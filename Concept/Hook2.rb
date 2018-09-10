puts

class Snowman
  attr_reader :snow_kind, :degree
  def initialize(arg)
    @snow_kind = arg[:kind]
    @degree = arg[:degree]
    local_initialize(arg)
  end
  def local_initialize(arg)
    nil
  end
end

class Taiwan_Snowman < Snowman
  attr_reader 
  def local_initialize(arg)
    nil
  end
  def play
    puts "play with children"
  end
end

class Japan_Snowdog < Snowman
  attr_reader :category
  def local_initialize(arg)
    @category = arg[:category]
  end
  def wolf
    puts "Snow #{category} wolf"
  end
end

class Europe_Snowman < Snowman
  attr_reader :gift
  def local_initialize(arg)
    @gift = arg[:gift]
  end
  def get_gift
    puts "Santa Claus give the #{gift}"
  end
end


taiwan = Taiwan_Snowman.new(kind: "artificial", degree: 0)
taiwan.play  #=> play with children


japan = Japan_Snowdog.new(kind: "mountain", degree: -20, category: "big ear dog")
japan.wolf  #=> Snow big ear dog wolf



europe = Europe_Snowman.new(kind: "polar", degree: -50, gift: "chocolate")
europe.get_gift  #=> Santa Claus give the chocolate

puts