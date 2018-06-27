require 'pry'
require 'byebug'

#Given a directed graph  your task is to complete the method isCycle  to detect if there is a cycle in the graph or not. You should not read any input from stdin/console.

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
    if @connections.key?(node1)
      @connections[node1] << node2 unless @connections[node1].include?(node2)
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

  def is_cycle
    visited = []
    path = []
    stack = []
    @nodes.each do |n|
      unless visited.include?(n)
        stack << n
        while !stack.empty?
          node = stack.pop
          if node ==  -1
            path.pop
            next
          end
          #  debugger
          if path.include?(node)
            p "#{path}" + " forms a cycle with: #{node}"
            return true
          else
            visited << node
            path << node
          end
          if @connections[node].empty?
            p path
            path.pop
          else
            stack << -1
          end
          @connections[node].each do |c|
            stack << c
          end
        end
      end
    end
    false
  end

end

g = Graph.new([1,2,3,4,5])
g.add_connection(1,2)
g.add_connection(1,3)
g.add_connection(1,4)
g.add_connection(3,4)
g.add_connection(3,5)
p 'without cycle'
p g.is_cycle
p 'with cycle'
g.add_connection(4,1)
p g.is_cycle

p 'New graph with cycle'

g1 = Graph.new([1,2,3,4])
g1.add_connection(1,2)
g1.add_connection(1,3)
g1.add_connection(3,4)
g1.add_connection(4,1)

p g1.is_cycle
