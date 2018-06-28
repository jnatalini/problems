#!/usr/bin/ruby
require 'byebug'

#Given a sorted array A[]  ( 0 based index ) and a key "k"  you need to complete the function bin_search to  determine the position of the key if the key is present in the array. If the key is not  present then you have to return -1. The arguments left and right denotes the left most index  and right most index of the array A[] .

def binary_search(input, number)
  if input.size == 1 && input[0] == number
    0
  elsif input.size == 1 && input[0] != number
    nil
  else
    mid = input.size / 2
    result = if input[mid] > number
      binary_search(input[0..(mid-1)], number)
    elsif input[mid] < number
      binary_search(input[mid..-1], number) + mid
    else
      mid
    end
    result
  end
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p binary_search(input, 9)
