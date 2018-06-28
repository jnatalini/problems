#!/usr/bin/ruby
require 'byebug'

#Given a stream of characters consisting only '0' and '1',  print the last index of the '1' present in it. Input stream may either be sorted in decreasing order or increasing order. If not present than print "-1".
#Example:
#Input: 00001
#Output: 4

def find_last_one(input)
  counter = 0
  last1 = -1
  while counter < input.size
    if input[counter] == 1
      last1 = counter
    end
    counter += 1
  end
  last1
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p find_last_one(input)
