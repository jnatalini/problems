#!/usr/bin/ruby
require 'byebug'

#Given a sequence, find the length of the longest increasing subsequence from a given sequence .
#The longest increasing subsequence means to find a subsequence of a given sequence in which the subsequence's elements are in sorted order, lowest
#to highest, and in which the subsequence is as long as possible. This subsequence is not necessarily contiguous, or unique.

#Note: Duplicate numbers are not counted as increasing subsequence.

#For example:
# length of LIS for
#{ 10, 22, 9, 33, 21, 50, 41, 60, 80 } is 6 and LIS is {10, 22, 33, 50, 60, 80}.

def find_seq(ind, value,inp)
  out = []
  counter = 0
  prev = -99999
  while counter < inp.size
    if ind < counter
      if value < inp[counter] && prev < inp[counter]
        prev = inp[counter]
        out << prev
      end
    elsif counter < ind
      if value>inp[counter] && prev < inp[counter]
        prev = inp[counter]
        out << prev
      end
    else
      prev = inp[counter]
      out << prev
    end
    counter += 1
  end
  out
end

def long_subseq(input)
  count = 0
  output = []
  tempoutput = []
  templen = 0
  len = 0
  while count < input.size
   value = input[count]
   tempoutput = find_seq(count, value, input)
   if len < tempoutput.size
     output = tempoutput
     len = tempoutput.size
   end
   count += 1
  end
  output
end

input = []
ARGV.each do |num|
  input << num.to_i
end

p long_subseq(input)
