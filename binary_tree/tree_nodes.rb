
class TreeNode
    attr_reader :value, :left_child, :right_child
    def initialize(val)
        @value = val
        @left_child = nil
        @right_child = nil
    end

    def full?
        !@left_child.nil? && !@right_child.nil?
    end

    def append_child(child)
        raise "Cannot take any more child" if full?
        if @left_child.nil?
            @left_child = child
        else
            @right_child = child
        end
    end

    def to_s
      "(#{@value})"
    end
end

class Tree
  def initialize(root)
    @root = TreeNode.new(root)
  end

  def insert(value)
    new_node = TreeNode.new(value)
    queue = [@root]
    until queue.empty?
      current_node = queue.shift
      unless current_node.full?
        current_node.append_child(new_node)
        break
      else
        queue << current_node.left_child
        queue << current_node.right_child
      end
    end
  end

  def level_order #breadth search does same level first
       result = []
       queue = [@root]
       until queue.empty?
           current_node = queue.shift
           queue << current_node.left_child unless current_node.left_child.nil?
           queue << current_node.right_child unless current_node.right_child.nil?
           result << current_node.to_s
       end
       result
   end


   def pre_order #these all call private methods but thats calvins style not necessary
       traverse_pre_order(@root)
   end

   def in_order
       traverse_in_order(@root)
   end

   def post_order
       traverse_post_order(@root)
   end

  # depth search, preorder
  #instead of a, bc, defg,
  #does one subtree at a time
  # abde

  private 

  def traverse_pre_order(node)
      return [] if node.nil?
      result = [node.to_s]
      result += traverse_pre_order(node.left_child)
      result +=  traverse_pre_order(node.right_child)
      result
  end

  def traverse_in_order(node)
      return [] if node.nil?
      result = traverse_in_order(node.left_child)
      result << node.to_s
      result += traverse_in_order(node.right_child)
      result
  end

  def traverse_post_order(node)
      return [] if node.nil?
      result = traverse_post_order(node.left_child)
      result += traverse_post_order(node.right_child)
      result << node.to_s
      result
  end


end

first_node = Tree.new('a')
first_node.insert('b')
first_node.insert('c')
first_node.insert('d')
first_node.insert('e')
first_node.insert('f')
first_node.insert('g')

#breadth
p first_node.level_order

#three depth traversals
p first_node.pre_order #root is at the very beginning, then right left
p first_node.in_order #root is in exact middle of traversal
p first_node.post_order
