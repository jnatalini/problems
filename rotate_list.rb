#!/usr/bin/ruby
require 'byebug'
#Given a singly linked list, rotate the linked list counter-clockwise by k nodes. Where k is a given positive integer smaller than or equal to length of the linked list. For example, if the given linked list is 10->20->30->40->50->60 and k is 4, the list should be modified to 50->60->10->20->30->40.

class Node
  attr_accessor :element, :nextl
  def initialize(value = 0, nextl = nil)
    @element = value
    @nextl = nextl
  end
end


def rotate(input, count)
 toappend = nil
 last = nil
 return input if input.nextl == nil
 while count > 0
   if input.nextl != nil
     if last == nil
       toappend = input
     else
       last.nextl = input
     end
     last = input
     input = input.nextl
     last.nextl = nil
   else
     input.nextl = toappend
     toappend = input
     last = input
     input = input.nextl
     last.nextl = nil
   end
   count -= 1
 end
 if toappend!=nil
   lastin = input
   while lastin.nextl!=nil
     lastin = lastin.nextl
   end
   lastin.nextl = toappend
 end
 input
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
print_list rotate(values, 4)
