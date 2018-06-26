#!/usr/bin/ruby
require 'byebug'
##If there are even nodes, then there would be two middle nodes, we need to print second middle element. For example, if given linked list is 1->2->3->4->5->6 then output should be 4.

class Node
  attr_accessor :element, :nextl
  def initialize(value = 0, nextl = nil)
    @element = value
    @nextl = nextl
  end
end


def reverse(input)
  if input.nextl == nil
    input
  else
    last = input.nextl
    head = reverse(input.nextl)
    input.nextl = nil
    last.nextl = input
    head
  end
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
print_list reverse(values)
