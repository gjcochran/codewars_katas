# https://www.codewars.com/kata/52b7ed099cdc285c300001cd/train/ruby
# ------------------ PROMPT -----------------------
# Write a function called sumIntervals/sum_intervals() that accepts an array of intervals, and returns the sum of all the interval lengths. Overlapping intervals should only be counted once.

# Intervals
# Intervals are represented by a pair of integers in the form of an array. The first value of the interval will always be less than the second value. Interval example: [1, 5] is an interval from 1 to 5. The length of this interval is 4.

# Overlapping Intervals
# List containing overlapping intervals:

# [
#    [1,4],
#    [7, 10],
#    [3, 5]
# ]
# The sum of the lengths of these intervals is 7. Since [1, 4] and [3, 5] overlap, we can treat the interval as [1, 5], which has a length of 4.

# Examples:
# sumIntervals( [
#    [1,2],
#    [6, 10],
#    [11, 15]
# ] ) => 9

# sumIntervals( [
#    [1,4],
#    [7, 10],
#    [3, 5]
# ] ) => 7

# sumIntervals( [
#    [1,5],
#    [10, 20],
#    [1, 6],
#    [16, 19],
#    [5, 11]
# ] ) => 19

# sumIntervals( [
#    [0, 20],
#    [-100000000, 10],
#    [30, 40]
# ] ) => 100000030
# Tests with large intervals
# Your algorithm should be able to handle large intervals. All tested intervals are subsets of the range [-1000000000, 1000000000]


#  ------------------ UNDERSTAND THE PROBLEM -----------------------
# input: array of arrays 
#   - inner array is an "interval"
#     - interval = array with 2 integers
#     - the first value will be smaller than second value
# output: integer
#   - sum of all interval lengths
#     - lenth of interval is second value - first value
#       - ex. [1, 5] ... 5 - 1 => 4
# rules: 
#   - if any intervals overlap, combine
#     - ex. [[1, 4], [3, 5]] => [[1, 5]]


#  ------------------ EXAMPLES / TEST CASES -----------------------
# how to handle negative integers???
# inner arrays can be empty?
# what to do if not all values are integers?

# GIVEN TESTS:
# p sum_of_intervals([[1, 5]]) # 4)
# p sum_of_intervals([[1, 5], [6, 10]]) # 8)
# p sum_of_intervals([[1, 5], [1, 5]]) # 4)
# p sum_of_intervals([[1, 4], [7, 10], [3, 5]]) # 7)
# p sumIntervals( [
#   [1,2],
#   [6, 10],
#   [11, 15]
# ] ) # => 9

# p sumIntervals( [
#   [1,5],
#   [10, 20],
#   [1, 6],
#   [16, 19],
#   [5, 11]
# ] ) # => 19

# p sumIntervals( [
#   [0, 20],
#   [-100000000, 10],
#   [30, 40]
# ] ) # => 100000030
#  ------------------ DATA STRUCTURES -----------------------

#  ------------------ ALGORITHM / ABSTRACTION -----------------------
# given an array of arrays, in which each inner array is of size 2, containing only integers, and with arr[0] < arr[1]
# first, need to consolidate inner arrays
#   - array.sort (will sort by arr[0]s)
#   - loop
#     - if statemnt ... if el[1] > arr[idx+1][0]
#       el[0] == min of el[0]s
#       el[1] == max of el[1]s
# then, iterate using each ... sum += arr[1] - arr[0] 
# return sum
#  ------------------ CODE -----------------------

def sum_of_intervals(intervals)
  sorted = intervals.sort.uniq
  counter = 0
  loop do
    break if sorted.size == 1
    if sorted[counter][1] > sorted[counter + 1][0]
      sorted[counter][0] = [sorted[counter][0], sorted[counter + 1][0]].min
      sorted[counter][1] = [sorted[counter][1], sorted[counter + 1][1]].max
      sorted.delete_at(counter + 1)
    else
      counter += 1
    end
    break if (counter == sorted.size - 1) 
  end
  sum = 0
  sorted.each { |el| sum += (el[1] - el[0]) }
  sum
end

p sum_of_intervals([[1, 5]]) # 4)
p sum_of_intervals([[1, 5], [6, 10]]) # 8)
p sum_of_intervals([[1, 5], [1, 5]]) # 4)
p sum_of_intervals([[1, 4], [7, 10], [3, 5]]) # 7)
p sum_of_intervals( [
   [1,2],
   [6, 10],
   [11, 15]
] ) # => 9

p sum_of_intervals( [
   [1,5],
   [10, 20],
   [1, 6],
   [16, 19],
   [5, 11]
] ) # => 19

p sum_of_intervals( [
   [0, 20],
   [-100000000, 10],
   [30, 40]
] ) # => 100000030

# codewars answer below, for reference
def sum_of_intervals_CW(intervals)
  intervals.map{ |i| (i[0]...i[1]).to_a }.flatten.uniq.size
end