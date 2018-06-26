#!/usr/bin/ruby
require 'byebug'
#Given an array of integers, find the length of the longest sub-sequence such that elements in the subsequence are consecutive integers, the consecutive numbers can be in any order.
#2 6 1 9 4 5 3
#output ---> 6

def consecutive(input)
  counter = 0
  len = 0
  min = 9999
  max = -9999
  elems = {}
  input.each do |elem|
    elems[elem] = 1
    min = elem if elem < min
    max = elem if elem > max
  end
  maxlen = -1
  len = 1
  output = [min]
  finaloutput = []
  counter = min + 1
  while counter <= max
    unless elems.key?(counter)
      maxlen = len if len > maxlen
      len = 0
      finaloutput = output.clone
      output = []
    else
      len += 1
      output << counter
    end
    counter += 1
  end
  if  maxlen < len
    finaloutput = output.clone
    maxlen = len
  end
  p maxlen
  p finaloutput

end

input = []
ARGV.each do |num|
  input << num.to_i
end

consecutive(input)
