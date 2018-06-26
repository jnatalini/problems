#!/usr/bin/ruby
def missing_number(input)
  hash = {}
  input.each do |num|
    hash[num] = true
  end
  counter = 1
  input.size.times do
    unless hash.key?(counter.to_s)
      return counter
    end
    counter +=1
  end
end

input = []
ARGV.each do |inp|
  input << inp
end
puts missing_number(input)
