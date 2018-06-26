#!/usr/bin/ruby
require 'byebug'
#Given an array having both positive an negative integers . Your task is to complete the function maxLen which returns the length of maximum subarray with 0 sum . The function takes two arguments an array A and n where n is the size of the array A .
#15  -2  2  -8  1  7  10 23
#output ---> -2  2  -8  1  7

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
