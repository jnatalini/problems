#!/usr/bin/ruby
require 'byebug'

#Given an array A [ ] having distinct elements, the task is to find the next greater element for each element of the array in order of their appearance in the array. If no such element exists, output -1

def next_greatest(input)
  counter = 0
  while counter < input.size
    counter2 = counter + 1
    element = input[counter]
    max = element
    while counter2 < input.size
      if input[counter2] > max
        max = input[counter2]
        break
      end
      counter2 += 1
    end
    if max > element
      p "#{element} next larger #{max}"
    else
      p "#{element} next larger -1"
    end
    counter += 1
  end
end

values = []
ARGV.each do |elem|
  values << elem.to_i
end

p next_greatest(values)
