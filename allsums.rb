#!/usr/bin/ruby
require 'byebug'

# Write three functions that compute the sum of the numbers in a given list using a for-loop, a while-loop, and recursion.

def for_sum(input)
  output = 0
  input.each do |el|
    output += el
  end
  output
end

def while_sum(input)
  output = 0
  counter = 0
  while counter < input.size
    output += input[counter]
    counter += 1
  end
  output
end

def rec_sum(input)
  if input.size == 1
    input[0]
  else
    input[0] + rec_sum(input[1..-1])
  end
end


input = []
ARGV.each do |num|
  input << num.to_i
end

p for_sum(input)
p while_sum(input)
p rec_sum(input)
