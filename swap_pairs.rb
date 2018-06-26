#!/usr/bin/ruby
require 'byebug'
#Given two arrays of integers, write a program to check if a pair of values (one value from each array) exists such that swapping the elements of the pair will make the sum of two arrays equal.

def maxlen(input)
  counter = 0
  len = 0
  elems = []
  output = []
  input.each do |elem|
    counter2 = counter + 1
    sum  = elem
    elems = [elem]
    while  counter2 < input.size
      sum += input[counter2]
      elems << input[counter2]
      if sum == 0  && len < (counter2 - counter + 1)
        len = (counter2 - counter + 1)
        output = elems.clone
      end
      counter2 += 1
    end
    counter += 1
  end
  p output
  len
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p maxlen(input)
