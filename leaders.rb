#!/usr/bin/ruby
require 'byebug'

# Write a program to print all the LEADERS in the array. An element is leader if it is greater than all the elements to its right side. The rightmost element is always a leader.
# Input: 16 17 4 3 5 2
# Output: 17 5 2

def leaders(input)
  leader = []
  temp_lead = 0
  counter = 0
  while counter < input.size
    counter2 = counter + 1
    temp_lead = input[counter]
    while counter2 < input.size && temp_lead > input[counter2]
      counter2 += 1
    end
    leader << temp_lead if counter2 == input.size
    counter += 1
  end
  leader
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p leaders(input)
