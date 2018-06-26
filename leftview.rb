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
root.left_view
p 'new example'
#Example tree 2
root = TreeNode.new(1,nil, right_child)
root.left_view
p 'new example'
#Example tree 3
root = TreeNode.new(1,left_child,nil)
root.left_view

p 'new example'
#Example tree 4
root = TreeNode.new(1,nil, right_child4)
root.left_view
