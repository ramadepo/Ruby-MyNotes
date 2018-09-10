puts
require 'benchmark'





# def a(&block)
#   block.call if block_given?
# end

# a{puts 1}
# a &proc{puts 2}




# a(&proc{puts 3})
# a({puts 4})    #=>error




# p (&proc{puts 1})    #=>error
# p ({puts 1})    #=>error

# p(&proc{puts 1})    #nothing
# p({puts 1})    #error

# p proc{puts 1}    #Proc......

# p &proc{puts 1}    #nothing
# p {puts 1}    #nothing

# p&proc{puts 1}    #=>false
# p{puts 1}    #nothing





# class Object
#   def to_proc
#     proc{
#       |x|
#       x += x
#     }
#   end
# end

# obj = Object.new

# [1,2,3,4,5]map &obj    #=>[2,4,6,8,10]

# a = proc{
#   |x|
#   x += x
# }

# [1,2,3,4,5].map a    #=>error
# [1,2,3,4,5].map &a    #=>[2,4,6...]
# [1,2,3,4,5].map &:a    #=>error
# [1,2,3,4,5].map &&a    #=> #<Proc.....>  因為變成and
# [1,2,3,4,5].map &(&a)    #=>error


# def asdfasdf
#     puts 123123123123123
# end


# [1,2,3,4,5].map &:to_s    #=>回傳["1","2".....]
# [1,2,3,4,5].map &to_s    #=>error
# [1,2,3,4,5].map(&:to_s)    #=>回傳["1","2".....]
# [1,2,3,4,5].map(&to_s)    #=>error

# [1,2,3,4,5].map &:asdfasdf    #=>123123.....*5line 回傳[nil,nil....]
# [1,2,3,4,5].map &asdfasdf    #=>123123123*1line 回傳Enumerator[1,2,3...]
# [1,2,3,4,5].map(&:asdfasdf)    #=>123123.....*5line 回傳[nil,nil....]
# [1,2,3,4,5].map(&asdfasdf)    #=>123123123*1line 回傳Enumerator[1,2,3...]


# &符號會對後面接的東西代表的東西執行to_proc 然後把產出的proc轉成block
# to_proc是Symbol的method



# def methodA
#   puts "this is a method"  #=>this is a method
# end$

# methodA

# m = method(:methodA)  #=>#<Method: main.methodA>
# m.call  #=>this is a method

# def fbi_get_et(et)
#   puts et.planet
#   puts et.language
#   puts et.super_ability
#   puts et.target
# end


# class ET
#   attr_accessor :planet,:language
#   def initialize
#     @planet = "Keron Star"
#     @language = "kero kero kero"
#   end
#   def super_ability
#     "Gin Keron Wave"
#   end
#   def target
#     "Conquer Blue Star"
#   end
#   # def somethin_et_special
#   #   ...

#   # end
# end

# class Human
#   attr_accessor :planet,:language
#   def initialize
#     @planet = "Earth"
#     @language = "English"
#   end
#   def super_ability
#     "Nothing"
#   end
#   def target
#     "Get the Green Card"
#   end
#   # def something_human_special
#   #   ...


#   # end
# end

# keroro = ET.new
# fbi_get_et(keroro)

# rama = Human.new
# fbi_get_et(rama)

class SpeedTest
  def initialize
    @count = 10_000_000
  end
  def yield_way
    @count.times { yield }
  end
  def block_way(&block)
    @count.times &block
  end
  def call_way(&block)
    @count.times { block.call }
  end
end

test = SpeedTest.new

Benchmark.bmbm do |x|
  x.report { test.yield_way do ; a = 1 ; end }
  x.report { test.block_way do ; a = 1 ; end }
  x.report { test.call_way  do ; a = 1 ; end }
end






puts