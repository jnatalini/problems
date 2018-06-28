#!/usr/bin/ruby
require 'byebug'

#The task is to complete merge() function which is used to implement Merge Sort.


def merge(part1, part2)
  output = []
  counter = 0
  pointer1 = 0
  pointer2 = 0
  while counter < part1.size + part2.size
    if pointer1 < part1.size && pointer2 < part2.size
      if part1[pointer1] < part2[pointer2]
        output << part1[pointer1]
        pointer1 += 1
      elsif part1[pointer1] > part2[pointer2]
        output << part2[pointer2]
        pointer2 += 1
      else
        output << part1[pointer1]
        output << part2[pointer2]
        pointer2 += 1
        pointer1 += 1
      end
    elsif pointer1 >= part1.size && pointer2 < part2.size
      output << part2[pointer2]
      pointer2 += 1
    elsif pointer2 >= part2.size && pointer1 < part1.size
      output << part1[pointer1]
      pointer1 += 1
    end
    counter += 1
  end
  output
end

def merge_sort(input)
  if input.size == 2
    if input[0] > input[1]
      temp = input[1]
      input[1] = input[0]
      input[0] = temp
    end
    input
  elsif input.size == 1
    input
  else
    mid = input.size / 2
    merge(merge_sort(input[0..mid - 1]), merge_sort(input[mid..-1]))
  end
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p merge_sort(input)
