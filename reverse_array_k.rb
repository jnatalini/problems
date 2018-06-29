#!/usr/bin/ruby
require 'byebug'

#Given an array, reverse every sub-array formed by consecutive k elements.
#Input:  1 2 3 4 5 , k=3
#Output: 3 2 1 5 4

def reverse_sub(input, k)
  reverse = []
  counter = 0
  while counter < input.size
    stack = []
    counter2 = counter
    while counter2 < [counter + k,input.size].min
      stack << input[counter2]
      counter2 += 1
    end
    while !stack.empty?
      reverse << stack.pop
    end
    counter += k
  end
  reverse
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p reverse_sub(input, 3)
