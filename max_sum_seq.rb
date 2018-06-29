#!/usr/bin/ruby
require 'byebug'

#Given an array of n positive integers. Write a program to find the sum of maximum sum subsequence of the given array such that the integers in the subsequence are sorted in increasing order.
# Output: 1 101 2 3 100 4 5
# Input: 106

def seq(ind, input)
  output = []
  counter = 0
  prev = input[0]
  while counter < input.size
    if counter < ind
      if input[counter] < input[ind] && prev <= input[counter]
        output << input[counter]
        prev = input[counter]
      end
    elsif counter > ind
      if input[counter] > input[ind] && prev <= input[counter]
        output << input[counter]
        prev = input[counter]
      end
    else
      output << input[ind]
      prev = input[counter]
    end
    counter += 1
  end
  output
end

def sum(arr)
  sum = 0
  return 0 if arr.nil?
  arr.each do |el|
    sum += el
  end
  sum
end

def max_seq(input)
  counter = 0
  max = 0
  output = []
  while counter < input.size
    tempout = seq(counter, input)
    tempsum = sum(tempout)
    if tempsum > max
      output = tempout
      max = tempsum
    end
    counter += 1
  end
  output
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p max_seq(input)
