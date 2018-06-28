#!/usr/bin/ruby
require 'byebug'
#Given N activities with their start and finish times. Select the maximum number of activities that can be performed by a single person, assuming that a person can only work on a single activity at a time.
#1 3 0 5 8 5
#2 4 6 7 9 9
#Output:
#4
#

def maxnum(input)
  times = []
  counter = 0
  lens = []
  while counter < input.size
    len = input[counter + 1] - input[counter]
    times << [input[counter], input[counter + 1], len]
    lens << len unless lens.include?(len)
    counter += 2
  end
  lens.sort!

  hash = {}
  lens = {}
  times.each do |t|
    if hash.key?(t[0])
      hash[t[0]] << t
    else
      hash[t[0]] = [t]
    end
    if lens.key?(t[2])
      lens[t[2]] << t
    else
      lens[t[2]] = [t]
    end
  end

  result = []
  lens.keys.sort.each do |ln|
    hash.keys.sort.each do |c|
      hash[c].each do |rec|
        result << rec if (rec[2] == ln && (result.empty? || result[-1][0] != rec[0])) && !overlaps(result, rec)
      end
    end
  end
  p result
end

def overlaps(elements, element)
  elements.each do |e|
    return true if (e[0] >= element[0] && e[1] <= element[1]) || (e[0] <= element[0] && e[1] >= element[1])
  end
  false
end

input = []
ARGV.each do |num|
  input << num.to_i
end

maxnum(input)
