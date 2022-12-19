# https://www.codewars.com/kata/5547cc7dcad755e480000004/train/ruby

# A friend of mine takes the sequence of all numbers from 1 to n (where n > 0).
# Within that sequence, he chooses two numbers, a and b.
# He says that the product of a and b should be equal to the sum of all numbers in the sequence, excluding a and b.
# Given a number n, could you tell me the numbers he excluded from the sequence?
# The function takes the parameter: n (n is always strictly greater than 0) and returns an array or a string (depending on the language) of the form:

# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or or [{a, b}, ...]
# with all (a, b) which are the possible removed numbers in the sequence 1 to n.

# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or ... will be sorted in increasing order of the "a".

# It happens that there are several possible (a, b). The function returns an empty array (or an empty string) if no possible numbers are found which will prove that my friend has not told the truth! (Go: in this case return nil).

# Examples:
# removNb(26) should return [(15, 21), (21, 15)]
# or
# removNb(26) should return { {15, 21}, {21, 15} }
# or
# removeNb(26) should return [[15, 21], [21, 15]]
# or
# removNb(26) should return [ {15, 21}, {21, 15} ]
# or
# removNb(26) should return "15 21, 21 15"

          # irb(main):001:0> (1..26).inject(:+) - 15 - 21
          # => 315
          # irb(main):002:0> 15 * 21
          # => 315

def removNb(n)
  arr = (1..n).to_a
  sum = arr.inject(:+)
  result = []
  counter = 0
  loop do
    temp = []
    temp << arr.map { |num| [[num, arr[counter]], num * arr[counter] == (sum - num - arr[counter])] }
    temp.flatten!(1)
    result << temp.select { |el| el[1] == true }
    counter += 1
    break if counter == arr.size
  end
  result = result.flatten(2)
  result.delete(true)
  result.sort
end

p removNb(26) # [[15, 21], [21, 15]])
p removNb(100) # [])

# this code works well on all tests, but times out on the biggest codewars tests so need to refactor