#!/usr/bin/ruby

#The problem is to count all the possible paths from top left to bottom right of a  MxN matrix with the constraints that from each cell you can either move to right or down.

def find_paths(x, y)
  if x == 1 && y==1
    1
  else
    pathsx = 0
    pathsy = 0
    pathsx = find_paths(x - 1, y)  if x>1
    pathsy = find_paths(x, y - 1)  if y>1
    pathsx + pathsy
   end
end

input_x = ARGV[0]
input_y = ARGV[1]

p find_paths(input_x.to_i, input_y.to_i)
