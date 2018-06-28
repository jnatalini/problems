#!/usr/bin/ruby
require 'byebug'

#Given two sequences, find the length of longest subsequence present in both of them. Both the strings are of uppercase.
#Example
#Inputs:
#ABCDGH
#AEDFHR
#Output:   3

def find_seq(seqa,seqb)
  counter = 0
  subseq = []
  counter2 = 0
  counterfound = 0
  while counter < seqa.size
    counter2 = counterfound
    while counter2 < seqb.size
      if seqb[counter2] == seqa[counter]
        subseq << seqb[counter2]
        counterfound = counter2
      end
      counter2 += 1
    end
    counter += 1
  end
  subseq
end

def main_seq(seqa,seqb)
  final_len = 0
  output = []
  temp_output = []
  counter = 0
  while counter < seqa.size
    temp_output = find_seq(seqa[counter..-1], seqb)
    if final_len < temp_output.size
      final_len = temp_output.size
      output = temp_output
    end
    counter += 1
  end
  output
end

def long_common(seq1, seq2)
  if seq1.size > seq2.size
    main_seq(seq1, seq2)
  else
    main_seq(seq2, seq1)
  end
end


input1 = ARGV[0]
input2 = ARGV[1]


p long_common(input1, input2)
