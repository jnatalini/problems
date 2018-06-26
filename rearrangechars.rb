#!/usr/bin/ruby
#Given a string with repeated characters, task is to rearrange characters in a string such that no two adjacent characters are same.

class Queue
  def initialize(elements=[])
    @stackadd = []
    @stackremove = []
    elements.each do |el|
      @stackadd << el
    end
  end

  def add(element)
    @stackadd << element
  end

  def remove
    while @stackadd.size > 0
      @stackremove << @stackadd.pop
    end
    result = @stackremove.pop
    while @stackremove.size > 0
      @stackadd << @stackremove.pop
    end
    result
  end

  def empty?
    @stackadd.empty?
  end

  def size
    @stackadd.size
  end
end

def rearrangechars(input)
  output = [input[0]]
  pending = []
  queue = Queue.new
  previous = input[0]
  index = 1
  while index < input.size
    current = input[index]
    output << current  unless current == previous
    queue.add(current) if current == previous
    previous = input[index]
    index += 1
  end

  counter = 0
  size = queue.size
  while !queue.empty? && counter < (size * 3)
    elem = queue.remove
    if elem!=previous
      output << elem
      previous = elem
    else
      queue.add(elem)
    end
    counter += 1
  end
  p queue
  output
end

input = ARGV[0]
p input
p rearrangechars(input)











