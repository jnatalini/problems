#!/usr/bin/ruby
require 'byebug'

#Given a String of length N reverse the words in it. Words are separated by dots.
def reverse_word(word)
  index = word.size - 1
  result = ''
  while index >= 0
    result += word[index]
    index -= 1
  end
  result
end

def reverse(input)
  result = ''
  index = 0
  word = ''
  while index <= (input.size - 1)
    if input[index] == '.'
      result += reverse_word(word) + '.'
      word = ''
    else
      word += input[index]
    end
    index += 1
  end
  result
end

input = ARGV[0]
p input
p reverse(input)
