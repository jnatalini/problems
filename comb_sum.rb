#!/usr/bin/ruby
require 'byebug'

# Given an array of integers A and a sum B, find all unique combinations in A where the sum is equal to B. The same repeated number may be chosen from A unlimited number of times.

# Example:
# Given A = 2,4,6,8 and B(sum) = 8,
# A solution set is:
# [2, 2, 2, 2]
# [2, 2, 4]
# [2, 6]
# [4, 4]
# [8]

def comb_sum(input, sum)
  #p input
  counter = 0
  output = []
  final = []
  while counter < input.size
    output = []
    output << input[counter]
    thesum = sum - input[counter]
    while (thesum != 0) && (thesum % input[counter] == 0)
      output << input[counter]
      thesum = thesum - input[counter]
      if thesum % input[counter] != 0
        break
      end
    end

    counter2 = 0
    while counter2 <  input.size && thesum != 0
      while (thesum != 0) && (thesum % input[counter2] == 0)
        output << input[counter2]
        thesum = thesum - input[counter2]
        if thesum % input[counter2] != 0
          break
        end
      end
      counter2 += 1
    end

    final << output if thesum == 0
    counter += 1
  end
  final
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p comb_sum(input, 8)
