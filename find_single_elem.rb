#!/usr/bin/ruby
require 'byebug'

#Given a sorted array of integers, every element appears twice except for one. Find that single one in linear time complexity and without using extra memory.

#Example:
#In:
#1 1 2 2 3 3 4 50 50 65 65
#Out: 4

def find_single_elem(input)
  counter = 1
  previous = input[0]
  double = false
  while counter < input.size
    if previous == input[counter]
      if !double
        double = true
      end
    else
      if double
        previous = input[counter]
        double = false
      else
        return previous
      end
    end
    counter += 1
  end
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p find_single_elem(input)
