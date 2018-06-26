#!/usr/bin/ruby
require 'byebug'
#Given an array having both positive an negative integers . Your task is to complete the function maxLen which returns the length of maximum subarray with 0 sum . The function takes two arguments an array A and n where n is the size of the array A .
#15  -2  2  -8  1  7  10 23
#output ---> -2  2  -8  1  7

def count_distinct(input, window)
  counter = 0
  len = 0
  elems = {}
  output = []
  input.each do |elem|
    counter2 = counter + 1
    sum  = 1
    elems = {}
    elems[elem] = 1
    win = window - 1
    while  counter2 < input.size && win > 0
      unless elems.key?(input[counter2])
        sum += 1
        elems[input[counter2]] = 1
      end
      counter2 += 1
      win -= 1
    end
    if win == 0
      p elems
      p sum
    end
    counter += 1
  end
end

input = []
ARGV.each do |num|
  input << num.to_i
end

count_distinct(input, 4)
