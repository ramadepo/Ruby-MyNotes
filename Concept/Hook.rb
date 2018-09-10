puts

class Snowman
  attr_reader :snow_kind, :degree
  def initialize(kind, degree)
    @snow_kind = kind
    @degree = degree
  end
end

class Taiwan_Snowman < Snowman
  def initialize(kind, degree)
    super(kind, degree)
  end
  def play
    puts "play with children"
  end 
end

class Japan_Snowdog < Snowman
  attr_reader :category
  def initialize(kind, degree, category)
    super(kind, degree)
    @category = category
  end
  def wolf
    puts "Snow #{category} wolf"
  end
end

class Europe_Snowman < Snowman
  attr_reader :gift
  def initialize(kind, degree, gift)
    super(kind, degree)
    @gift = gift
  end
  def get_gift
    puts "Santa Claus give the #{gift}"
  end
end

taiwan = Taiwan_Snowman.new("artificial", 0)
taiwan.play  #=> play with children


japan = Japan_Snowdog.new("mountain", -20, "big ear dog")
japan.wolf  #=> Snow big ear dog wolf



europe = Europe_Snowman.new("polar", -50, "chocolate")
europe.get_gift  #=> Santa Claus give the chocolate

puts