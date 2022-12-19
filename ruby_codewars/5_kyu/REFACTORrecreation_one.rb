# https://www.codewars.com/kata/55aa075506463dac6600010d/train/ruby

# 1, 246, 2, 123, 3, 82, 6, 41 are the divisors of number 246. Squaring these divisors we get: 1, 60516, 4, 15129, 9, 6724, 36, 1681. The sum of these squares is 84100 which is 290 * 290.

# Task
# Find all integers between m and n (m and n integers with 1 <= m <= n) such that the sum of their squared divisors is itself a square.

# We will return an array of subarrays. The subarrays will have two elements: first the number the squared divisors of which is a square and then the sum of the squared divisors.

# Example:
# list_squared(1, 250) --> [[1, 1], [42, 2500], [246, 84100]]
# list_squared(42, 250) --> [[42, 2500], [246, 84100]]

def list_squared(m, n)
  solution = []
  counter = m
  loop do
    result = []
    1.upto(counter) do |i|
      result << i if counter % i == 0
    end
    sqd = result.map { |el| el ** 2 }.sum
    if Math.sqrt(sqd).to_s.end_with?('.0')
      solution << [counter, sqd]
    end
    counter += 1
    break if counter > n
  end
  solution
end

p list_squared(1, 250) # [[1, 1], [42, 2500], [246, 84100]])
p list_squared(42, 250) # [[42, 2500], [246, 84100]])
p list_squared(250, 500) # [[287, 84100]])

# this solution works for every test, but is not efficient enough and takes too long for all of the attempt tests... so need to refactor at a later date