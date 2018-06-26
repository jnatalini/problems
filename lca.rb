require 'pry'
require 'byebug'
class TreeNode
  attr_accessor :left, :right, :value
  def initialize(value, left, right)
    @value = value
    @left, @right = left, right
  end

  def print_inorder
    @left.print_inorder unless @left.nil?
    puts @value
    @right.print_inorder unless @right.nil?
  end

  def pre_order
    puts @value
    @left.pre_order unless @left.nil?
    @right.pre_order unless @right.nil?
  end

  def post_order
    @left.post_order unless @left.nil?
    @right.post_order unless @right.nil?
    puts @value
  end

  def bst?
    return false if (@left != nil and @value < @left.value)
    return false if (@right != nil and @value > @right.value)
    left_bst = @left == nil ? true : @left.bst?
    right_bst = @right == nil ? true : @right.bst?
    return (left_bst and right_bst)
  end

  def left_view
    puts @value
    @left.left_view unless @left.nil?
    @right.left_view if @left.nil? && !@right.nil?
  end


  def find_path(a)
    stacka = []
    stacka << self
    path = []
    while !stacka.empty?
      node = stacka.pop
      path << node
      if node.value == a
        return path.map(&:value)
      elsif (node.right.nil? && node.left.nil?)
        path.pop
        if path[-1].right == node
          path.pop
        end
      else
        stacka << node.right unless node.right.nil?
        stacka << node.left unless node.left.nil?
      end
    end
  end


  def lca(a, elb)
    patha = find_path(a)
    pathb = find_path(elb)
    counter = 0
    previous = -1
    while (counter < patha.size && counter < pathb.size && patha[counter] == pathb[counter])
      previous = patha[counter]
      counter += 1
    end
    previous
  end
end

=begin
left_child = TreeNode.new(1, nil, nil)
right_child = TreeNode.new(3, nil, nil)
root = TreeNode.new(2, left_child, right_child)
p 'inorder:'
root.print_inorder
p 'preorder:'
root.pre_order
p 'postorder:'
root.post_order
p "BST?: #{root.bst?}"
root.value=6
p 'inorder:'
root.print_inorder
p "BST?: #{root.bst?}"
=end
#Example tree 1
right_child = TreeNode.new(8, nil, nil)
left_child = TreeNode.new(4, nil, right_child)
right_child2 = TreeNode.new(5, nil, nil)
left_child2 = TreeNode.new(2, left_child, right_child2)
left_child3 = TreeNode.new(6, nil, nil)
right_child3 = TreeNode.new(7, nil, nil)
right_child4 = TreeNode.new(3, left_child3, right_child3)
root = TreeNode.new(1, left_child2, right_child4)

p root.find_path(5)
p root.find_path(6)
#p root.find_path(2)

p root.lca(5,6)

