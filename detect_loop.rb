#!/usr/bin/ruby
require 'byebug'
#Given a linked list, check if the the linked list has a loop. Linked list can contain self loop.

class Node
  attr_accessor :element, :nextl
  def initialize(value = 0, nextl = nil)
    @element = value
    @nextl = nextl
  end
end

def has_loop(input)
 visited = {}
 while input!=nil
   if visited.key?(input.element)
     return true
   else
     visited[input.element] = true
   end
   input = input.nextl
 end
 false
end

def print_list(list)
  p list
  l = ''
  while list != nil
    l += list.element + ' '
    list = list.nextl
  end
  p l
end


values = nil
counter = 0
previous = nil
ARGV.each do |elem|
  node  = Node.new
  node.element = elem
  node.nextl = nil
  unless counter == 0
    previous.nextl = node
  else
    values = node if counter == 0
  end
  previous = node
  counter += 1
end

#print_list reverse_group(values, 4)
p has_loop(values)
