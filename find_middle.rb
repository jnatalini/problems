#!/usr/bin/ruby
require 'byebug'
#Given a singly linked list, find middle of the linked list. For example, if given linked list is 1->2->3->4->5 then output should be 3.
#If there are even nodes, then there would be two middle nodes, we need to print second middle element. For example, if given linked list is 1->2->3->4->5->6 then output should be 4.

class Node
  attr_accessor :element, :nextl
  def initialize(value = 0, nextl = nil)
    @element = value
    @nextl = nextl
  end
end


def middle_elem(input)
  elements = []
  elements << input.element
  node = input.nextl
  while node != nil
    elements << node.element
    node = node.nextl
  end
  middle = elements.size / 2
  elements[middle]
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
p middle_elem(values)
