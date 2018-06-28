#!/usr/bin/ruby
require 'byebug'

#You are given N pairs of numbers. In every pair, the first number is always smaller than the second number. A pair (c, d) can follow another pair (a, b) if b < c. Chain of pairs can be formed in this fashion. Your task is to complete the function maxChainLen which returns an integer denoting the longest chain which can be formed from a given set of pairs.
#(i) the given pairs are {{5, 24}, {39, 60}, {15, 28}, {27, 40}, {50, 90} },the longest chain that can be formed is of length 3, and the chain is {{5, 24}, {27, 40}, {50, 90}}

def max_chain(input)
  pairs = []
  counter = 0
  while counter < input.size
    pairs << [input[counter], input[counter + 1]]
    counter += 2
  end
  pairs.sort!
  counter = 1
  prev = pairs[0]
  output = [prev]
  while counter < pairs.size
    if prev[1] < pairs[counter][0]
      prev = pairs[counter]
      output << pairs[counter]
    end
    counter += 1
  end
  output
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p max_chain(input)
