#!/usr/bin/ruby
require 'byebug'

#Write a function that computes the list of the first 100 Fibonacci numbers. By definition, the first two numbers in the Fibonacci sequence are 0 and 1, and each subsequent number is the sum of the previous two. As an example, here are the first 10 Fibonnaci numbers: 0, 1, 1, 2, 3, 5, 8, 13, 21, and 34.

def fibo_rec(input)
  if input == 0
    0
  elsif input == 1
    1
  else
    fibo_rec(input - 1) + fibo_rec(input - 2)
  end
end

def fibo_iter(input)
   if input == 0
    0
  elsif input == 1
    1
  else
    counter = 2
    acc1 = 0
    acc2 = 1

    while counter <= input
      temp = acc1
      acc1 = acc2
      acc2 = acc1 + temp
      counter += 1
    end
    acc2
  end
end

input = ARGV[0].to_i
counter = 0
while counter <= input
  p fibo_iter(counter)
  counter += 1
end
