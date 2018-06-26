#!/usr/bin/ruby
require 'byebug'
#Given an expression string exp, examine whether the pairs and the orders of “{“,”}”,”(“,”)”,”[“,”]” are correct in exp.
#For example, the program should print 'balanced' for exp = “[()]{}{[()()]()}” and 'not balanced' for exp = “[(])”
def paired(l1,l2)
 (l1=='{' && l2 == '}') ||
 (l1=='}' && l2 == '{') ||
 (l1=='[' && l2 == ']') ||
 (l1==']' && l2 == '[') ||
 (l1=='(' && l2 == ')') ||
 (l1==')' && l2 == '(')
end

def open(symb)
  ['{','[','('].include?(symb)
end

def balanced(input)
  stack = []
  index = 0
  while index <= (input.size - 1)
    if open(input[index])
      stack << input[index]
    else
      unless paired(input[index], stack.pop)
        return false
      end

    end
    index += 1
  end
  stack.empty? ? true : false
end

input = ARGV[0]
p input
p balanced(input)
