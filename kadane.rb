#!/usr/bin/ruby
#Given an array containing both negative and positive integers. Find the contiguous sub-array with maximum sum.

#input 1,2,3,4,-5
#output 1,2,3,4

#inut 1,2,3,-3,4,5,-6,9
#output: 9

#input 1,2,-3,1,1,1,-8
#output:1,2

def maxsum_sub(input)
  best = 0
  bestArray = []
  max = 0
  result = []
  input.each do |elem|
     if elem >= 0
       max += elem
       result << elem
     else
        if best < max
          best = max
          bestArray = result
        end
        max = 0
        result = []
     end
  end
  if best < max
    bestArray = result
  end
  bestArray
end

input = []
ARGV.each do |inp|
  input << inp.to_i
end
p maxsum_sub(input)











