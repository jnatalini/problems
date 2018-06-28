#!/usr/bin/ruby
require 'byebug'

#Given two numbers 'N' and 'S' , find the largest number that can be formed with 'N' digits and whose sum of digits should be equals to 'S'.
#2 9
#Output 90

#3 20
#Output 992

def totalsum(number)
  sum = 0
  nums = number
  while (nums != 0)
    sum += nums % 10
    nums = nums / 10
  end
  sum
end

def large_num(input)
  n = input[0]
  s = input[1]
  output = ''
  n.times do
    output = output + '9'
  end
  counter = output.to_i
  while counter > 0
    return counter if totalsum(counter) == s
    counter -= 1
  end
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p large_num(input)
