require 'get_process_mem'
require 'benchmark'
require 'linked-list'

class My_Node
  attr_accessor :value, :before
  def initialize(value)
    @value = value
  end
end

class My_Stack
  include Enumerable
  attr_reader :first, :last
  def initialize
    node = create_node(nil)
    @first = node
    @last = node
  end
  def create_node(value)
    My_Node.new(value)
  end
  def push(value)
    node = create_node(value)
    node.before = last
    @last = node
  end
  def pop
    return nil if first == last
    temp_node = last
    @last = temp_node.before
    temp_node.value
  end
  def each(&block)
    temp_node = last
    loop do
      if temp_node.value
        yield temp_node.value
        temp_node = temp_node.before
      else
        break
      end
    end
  end
end

################## output ##################
puts

# Benchmark.bm do |b|

#   count = 1_000_000
#   stack = My_Stack.new
#   b.report("My push") do
#     count.times do |i|
#       stack.push(i)
#     end
#   end

#   array = Array.new
#   b.report("Ruby's push") do
#     count.times do |i|
#       array.push(i)
#     end
#   end

#   b.report("My pop") do
#     count.times do
#       stack.pop
#     end
#   end

#   b.report("Ruby's pop") do
#     count.times do
#       array.pop
#     end
#   end

# end
################################################################
# Benchmark.bm do |b|

#   count = 1_000_000

#   stack = My_Stack.new
#   b.report("My_push") do
#     count.times do |i|
#       stack.push(i)
#     end
#   end

#   list = LinkedList::List.new
#   b.report("Gem_push") do
#     count.times do |i|
#       list.push(i)
#     end
#   end

#   b.report("My_pop") do
#     count.times do |i|
#       stack.pop
#     end
#   end

#   b.report("Gem_pop") do
#     count.times do |i|
#       list.pop
#     end
#   end

# end

puts
################## output ##################
GC.start
mem = GetProcessMem.new
p mem
