require 'benchmark'
require 'get_process_mem'
require 'murmurhash3'

class My_Map
  attr_reader :table, :table_size
  def initialize
    @table =  My_Table.new
    @table_size = 15
    @table[table_size - 1] = nil
  end
  def add(key, value)
    node = My_Node.new(key, value)
    index = calculate(key)
    insert(index, node)
  end
  def calculate(key)
    hash(key) % @table.size
  end
  def hash(key)
    if key.class == String
      MurmurHash3::V32.str_hash(key)
    elsif key.class == Integer
      MurmurHash3::V32.int64_hash(key)
    elsif key.class == Symbol
      MurmurHash3::V32.str_hash(key.to_s)
    end
  end
  def insert(index, node)
    if @table[index] == nil
      @table[index] = node
    else
      temp_node = @table[index]
      count = 0
      loop do
        if temp_node.key == node.key
          puts "error : duplicated key"
          break
        end
        if temp_node.link == nil
          temp_node.link = node
          break
        else
          temp_node = temp_node.link
          if count == 4
            refactor(node)
            break
          else
            count += 1
          end
        end
      end
    end
  end
  def refactor(node)
    temp_array = Array.new
    for i in 0...@table_size
      temp_node = @table[i]
      loop do
        if temp_node == nil
          break
        else
          temp_array.push(temp_node)
          temp_node = temp_node.link
        end
      end
    end
    @table = My_Table.new
    @table_size *= 2
    @table[table_size - 1] = nil
    for i in 0...temp_array.length
      add(temp_array[i].key, temp_array[i].value)
    end
    add(node.key, node.value)
  end
  def get(key)
    index = calculate(key)
    temp_node = @table[index]
    loop do
      if temp_node == nil
        puts "error : not found"
        break
      else
        if temp_node.key == key
          return temp_node.value
        else
          temp_node = temp_node.link
        end
      end
    end
  end
end

class My_Table < Array
end

class My_Node
  attr_reader :key, :value
  attr_accessor :link
  def initialize(key, value)
    @key = key
    @value = value
  end
end

################## output ##################
puts

Benchmark.bm do |b|

  count = 1_000_000
  map = My_Map.new
  b.report("My Hash") do
    count.times do |i|
      map.add(i,i)
    end
  end

  hash = Hash.new
  b.report("Ruby's Hash") do
    count.times do |i|
      hash[i] = i
    end
  end

  b.report("My get") do
    count.times do |i|
      map.get(i)
    end
  end

  b.report("Ruby's get") do
    count.times do |i|
      hash[i]
    end
  end

end

puts
################## output ##################
GC.start
mem = GetProcessMem.new
p mem
