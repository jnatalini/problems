require 'pry'
require 'byebug'

#Write a function to print the depth first traversal for a undirected graph from a given source s.
#Write a function to print the bredth first traversal for a graph from a given source s.

class Graph
  def initialize(nodes=[])
    @nodes = nodes
    @connections = {}
    nodes.each do |n|
      @connections[n] = []
    end
  end

  def add_node(node)
    @nodes << node
    @connections[node] = []
  end

  def add_connection(node1, node2)
    if @connections.key?(node1) && @connections.key?(node2)
      @connections[node1] << node2 unless @connections[node1].include?(node2)
      @connections[node2] << node1 unless @connections[node2].include?(node1)
    end
  end

  def dfs
    visited = []
    stack = []
    @nodes.each do |n|
      unless visited.include?(n)
         stack = []
         stack << n
         while !stack.empty?
           node = stack.pop
           unless visited.include?(node)
             p node
             visited << node
             @connections[node].each do |c|
               stack << c unless visited.include?(c)
             end
           end
         end
      end
    end
  end

  def bfs
    visited = []
    stack = []
    @nodes.each do |n|
      unless visited.include?(n)
         stack = []
         stack << n
         while !stack.empty?
           node = stack.shift
           unless visited.include?(node)
             p node
             visited << node
             @connections[node].each do |c|
               stack << c unless visited.include?(c)
             end
           end
         end
      end
    end
  end

end

g = Graph.new([1,2,3,4,5])
g.add_connection(1,2)
g.add_connection(1,3)
g.add_connection(1,4)
g.add_connection(3,4)
g.add_connection(3,5)
p g
p "dfs"
g.dfs
p "bfs"
g.bfs

