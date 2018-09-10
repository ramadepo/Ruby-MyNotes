require 'get_process_mem'
require 'tree'

class My_Node
  attr_accessor :left, :right, :value
  def initialize(value)
    @value = value
  end
end

class My_Tree
  include Enumerable
  attr_reader :root, :size
  def initialize
    @root = create_node(nil)
    @size = 0
  end
  def create_node(value)
    My_Node.new(value)
  end
  def insert(node = @root, value)
    if root.value
      if value > node.value
        insert(node.right, value) if node.right
        unless node.right
          @size += 1
          node.right = create_node(value)
        end
      elsif value < node.value
        insert(node.left, value) if node.left
        unless node.left
          @size += 1
          node.left = create_node(value)
        end
      else
        nil
      end
    else
      @root = create_node(value)
      @size += 1
    end
  end
  def delete(value)
    unless @root.value
      puts "no this data"
      return false
    end
    if value == @root.value
      # delete root
      if @root.left == nil && @root.right == nil
        # no child
        @root = nil
        @size -= 1
        return true
      elsif @root.left && @root.right
        # two child
        temp_node = @root.right
        temp_parent = @root
        loop do
          if temp_node.left == nil
            if temp_node == @root.right
              temp_node.left = @root.left
              @root = temp_node
              @size -= 1
              return true
            else
              temp_parent.left = nil
              temp_node.right = @root.right
              temp_node.left = @root.left
              @root = temp_node
              @size -= 1
              return true
            end
          else
            temp_parent = temp_node
            temp_node = temp_node.left
          end
        end
      else
        # one child
        @root = @root.left if @root.left
        @root = @root.right if @root.right
      end
    else
      parent = @root
      now = @root
      dir = "dir"
      loop do
        if now == nil
          puts "no this data"
          return false
        elsif value > now.value
          parent = now
          now = now.right
          dir = "right"
        elsif value < now.value
          parent = now
          now = now.left
          dir = "left"
        else
          if now.left == nil && now.right == nil
            # no child
            parent.right = nil if dir == "right"
            parent.left = nil if dir == "left"
            @size -= 1
            return true
          elsif now.left && now.right
            # two child
            temp_node = now.right
            temp_parent = now
            loop do
              if temp_node.left == nil
                if temp_node == now.right
                  parent.right = temp_node if dir == "right"
                  parent.left = temp_node if dir == "left"
                  @size -= 1
                  return true
                else
                  temp_parent.left = nil
                  parent.right = temp_node if dir == "right"
                  parent.left = temp_node if dir == "left"
                  temp_node.right = now.right
                  temp_node.left = now.left
                  @size -= 1
                  return true
                end
              else
                temp_parent = temp_node
                temp_node = temp_node.left
              end
            end
          else
            # one child
            if dir == "right"
              parent.right = now.left if now.left
              parent.right = now.right if now.right
            elsif dir == "left"
              parent.left = now.left if now.left
              parent.left = now.right if now.right
            end
            @size -= 1
            return true
          end
        end
      end
    end
  end
  def pre_order(node = @root, &block)
    yield node.value
    pre_order(node.left, &block) if node.left
    pre_order(node.right, &block) if node.right
  end
  def in_order(node = @root, &block)
    in_order(node.left, &block) if node.left
    yield node.value
    in_order(node.right, &block) if node.right
  end
  def post_order(node = @root, &block)
    post_order(node.left, &block) if node.left
    post_order(node.right, &block) if node.right
    yield node.value
  end
  def level_order(node = @root, &block)
    queue = Array.new
    loop do
      yield node.value
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
      queue.length != 0 ? (node = queue.shift) : break
    end
  end
  def get(node = @root, value)
    if value > node.value
      get(node.right, value) if node.right
    elsif value < node.value
      get(node.left, value) if node.left
    else
      node
    end
  end
  def each(&block)
    pre_order(&block)
  end
end


################## output ##################
puts

# count = 10_000
  
# tree = My_Tree.new
# count.times do |i|
#   tree.insert(i)
# end

# root = Tree::TreeNode.new("ROOT", "Root Content")
# count.times do |i|
#   root << Tree::TreeNode.new("#{i}",i)
#   root = root.children[0]
# end

puts
################## output ##################
GC.start
mem = GetProcessMem.new
p mem