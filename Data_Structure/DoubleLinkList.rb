require 'get_process_mem'
require 'benchmark'
require 'linked-list'

class My_Node
  attr_accessor :value, :before, :after
  def initialize(value)
    @value = value
  end
end

class My_Link
  include Enumerable
  attr_reader :first, :last, :length
  def initialize
    node = create_node(nil)
    @first = node
    @last = node
    @length = 0
  end
  def create_node(value)
    My_Node.new(value)
  end
  def add_back(value)
    node = create_node(value)
    last.after = node
    node.before = last
    @last = node
    @length += 1
  end
  def add_front(value)
    if first == last
      add_back(value)
    else
      node = create_node(value)
      temp_node = first.after
      temp_node.before = node
      node.after = temp_node
      first.after = node
      node.before = first
      @length += 1
    end
  end
  def delete(value)
    node = get(value)
    if node
      if node == last
        node.before.after = node.after
        @last = node.before
        @length -= 1
      else
        node.before.after = node.after
        node.after.before = node.before
        @length -= 1
      end
    else
      puts "delete nothing"
    end
  end
  def exist?(value)
    get(value) ? true : false
  end
  def get(node = first, value)
    return node if (value == node.value)
    get(node.after,value) if node.after
  end
  def each(&block)
    temp_node = first.after
    loop do
      if temp_node
        yield temp_node.value
        temp_node = temp_node.after
      else
        break
      end
    end
  end
end

################## output ##################
puts

# Benchmark.bm do |b|

  # count = 1_000_000

  # link = My_Link.new
  # b.report("My_add") do
    # count.times do |i|
    #   link.add_back(i)
    # end
  # end

  # list = LinkedList::List.new
  # b.report("Gem_add") do
    # count.times do |i|
    #   list.push(i)
    # end
  # end

  # b.report("My_each") do
  #   link.each{ |i| i+1 }
  # end

  # b.report("Gem_each") do
  #   list.each{ |i| i+1 }
  # end

# end

puts
################## output ##################
GC.start
mem = GetProcessMem.new
p mem