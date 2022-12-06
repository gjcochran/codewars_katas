# https://www.codewars.com/kata/5894318275f2c75695000146/train/ruby

# Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

# Example
# For n = 152, the output should be 52;

# For n = 1001, the output should be 101.

# Input/Output
# [input] integer n

# Constraints: 10 ≤ n ≤ 1000000.

# [output] an integer

def delete_digit(n)
  result = []
  counter = 0
  loop do
    arr = n.to_s.chars
    arr.delete_at(counter)
    result << arr.join.to_i 
    counter += 1
    break if counter == arr.size + 1
  end
  result.max
end

p delete_digit(152)