#!/usr/bin/ruby
require 'pry'
require 'byebug'

#A Hamiltonian path, is a path in an undirected or directed graph that visits each vertex exactly once. Given an undirected graph  the task is to check if a Hamiltonian path is present in it or not.
#Example:
##Input:  1 2 2 3 3 4 2 4
##Output: true

#Example 2:
##Input:  1 2 2 3 2 4
##Output: false

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

  def hamilton
    edgesl = []
    visited = []
    stack = []
    stack << @nodes[0]
    while !stack.empty?
      node = stack.pop
      counter = 0
      while counter < @connections[node].size
        c = @connections[node][counter]
        unless visited.include?(c)
          edgesl << [node,c]
          stack << c
          visited << c
        end
        counter += 1
      end
    end
    alledges = edges
    alledges.each do |e|
      return false unless has_value(e, edgesl)
    end
    true
  end

  def edges
    output = []
    @nodes.each do |n|
      @connections[n].each do |c|
        output << [n, c] unless has_value([n,c],output)
      end
    end
    output
  end

end

def equale(edge1, edge2)
  if edge1[0] == edge2[0]
    true if edge1[1] == edge2[1]
  elsif edge1[0] == edge2[1]
    true if edge1[1] == edge2[0]
  else
    false
  end
end

def has_value(edge, list)
  list.each do |e|
    return true if equale(edge,e)
  end
  false
end

g = Graph.new([1,2,3,4])
g.add_connection(1,2)
g.add_connection(2,3)
g.add_connection(3,4)
g.add_connection(2,4)
p g

p g.hamilton

g1 = Graph.new([1,2,3,4])
g1.add_connection(1,2)
g1.add_connection(2,3)
g1.add_connection(2,4)
p g1

p g1.hamilton
