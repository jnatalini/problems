#!/usr/bin/ruby
require 'byebug'

#Given an array A your task is to tell at which position the equilibrium first occurs in the array. Equilibrium position in an array is a position such that the sum of elements below it is equal to the sum of elements after it.
#example:
#  input: 1 3 5 2 2
#  output: 2

def eql(input)
  return 0 if input.size == 1
  counter = 1
  while counter < input.size - 1
    outputl = 0
    outputr = 0
    counter2 = 0
    while counter2 < input.size
      if counter < counter2
        outputl += input[counter2]
      elsif counter > counter2
        outputr += input[counter2]
      end
     counter2 += 1
    end
    return counter if outputl == outputr
    counter += 1
  end
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p eql(input)
