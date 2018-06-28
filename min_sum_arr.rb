#!/usr/bin/ruby
require 'byebug'

#Given two arrays, A and B, of equal size n, the task is to find the minimum value  of A[0] * B[0] + A[1] * B[1] +…+ A[n-1] * B[n-1], where shuffling of elements of arrays A and B is allowed.
#
#Input : A[] = {3, 1, 1} and B[] = {6, 5, 4}.
#Output : 23 Minimum value of S = 1*6 + 1*5 + 3*4 = 23.

#Input : A[] = { 6, 1, 9, 5, 4 } and B[] = { 3, 4, 8, 2, 4 }
#Output : 80. Minimum value of S = 1*8 + 4*4 + 5*4 + 6*3 + 9*2 = 80.

def min_sum(input)
  a = []
  b = []
  switch = false
  input.each do |el|
    if el == -1
      switch = true
    else
      if switch
        b << el
      else
        a << el
      end
    end
  end
  a.sort!
  b.sort!
  size = 0
  sum = 0
  while size < a.size
    sum += a[size] * b[a.size - 1 - size]
    size += 1
  end
  p sum
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p min_sum(input)
