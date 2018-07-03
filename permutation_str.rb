#!/usr/bin/ruby
require 'byebug'

# Given a string, print all permutations of a given string.
# Input: ABC
# Output: ABC ACB BAC BCA CAB CBA

def combine(str, arr)
  out = ''
  arr.each do |el|
    out += el
  end
  out + str
end

def permutation(arre,input)
  if input.size == 1
    p combine(input[0], arre)
  else
    counter = 0
    while counter < input.size
      if counter == 0
        arre << input[counter]
        permutation(arre,input[counter+1..-1])
      elsif counter + 1 == input.size
        arre << input[counter]
        permutation(arre,input[0..counter-1])
      else
        arre << input[counter]
        permutation(arre,input[0..counter-1] + input[counter+1..-1])
      end
      counter += 1
      arre.pop
    end
  end
end

input = []
ARGV.each do |num|
  input << num.to_s
end
permutation([],input)
