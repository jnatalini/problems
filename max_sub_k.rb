#!/usr/bin/ruby
require 'byebug'

# Given an array and an integer k, find the maximum for each and every contiguous subarray of size k.
#Input:  1 2 3 1 4 5 2 3 6 , k=3
#output: 3 3 4 5 5 5 6

def max_sub(input, k)
  maxs = []
  counter = 0
  while counter < input.size - (k - 1)
    counter2 = counter + 1
    temp_lead = input[counter]
    while counter2 < counter + k
      if temp_lead < input[counter2]
        temp_lead = input[counter2]
      end
      counter2 += 1
    end
    maxs << temp_lead
    counter += 1
  end
  maxs
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p max_sub(input, 3)
