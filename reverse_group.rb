#!/usr/bin/ruby
require 'byebug'
#Given a linked list, write a function to reverse every k nodes (where k is an input to the function).If a linked list is given as 1->2->3->4->5->6->7->8->NULL and k = 3 then output will be 3->2->1->6->5->4->8->7->NULL.

class Node
  attr_accessor :element, :nextl
  def initialize(value = 0, nextl = nil)
    @element = value
    @nextl = nextl
  end
end

def reverse(list)
  if list.nextl == nil
    list
  else
    last_before = list.nextl
    new_list = reverse(list.nextl)
    last_before.nextl = list
    list.nextl = nil
    new_list
  end
end

def reverse_group(input, count)
 oldlist = nil

 while (count - 1)  > 0
   oldlist = input if oldlist == nil
   oldlist = oldlist.nextl unless oldlist == nil
   count -= 1
 end
 temp = oldlist
 oldlist = oldlist.nextl
 temp.nextl = nil

 reversed = reverse(input)

 temprev = reversed
 while temprev.nextl != nil
   temprev = temprev.nextl
 end
 temprev.nextl = oldlist
 reversed
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

print_list reverse_group(values, 4)
