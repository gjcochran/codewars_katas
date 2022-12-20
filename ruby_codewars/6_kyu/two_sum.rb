# https://www.codewars.com/kata/52c31f8e6605bcc646000082/train/ruby

# Write a function that takes an array of numbers (integers for the tests) and a target number. It should find two different items in the array that, when added together, give the target value. The indices of these items should then be returned in a tuple / list (depending on your language) like so: (index1, index2).

# For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.

# The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers; target will always be the sum of two different items from that array).

# Based on: http://oj.leetcode.com/problems/two-sum/

# two_sum([1, 2, 3], 4) == {0, 2}

def two_sum(arr, target)
  # arr[0...-1].select.with_index { |el, idx| } 
  index = 0
  result = []
  loop do
    counter = index + 1
    loop do
      if arr[index] + arr[counter] == target
        result << index << counter
        break
      else
        counter += 1
      end
      break if counter == arr.size
    end
    break if result.any?
    index += 1
    break if index == arr.size - 1
  end
  result
end


p two_sum([1, 2, 3], 4) # [0, 2])
p two_sum([1234, 5678, 9012], 14690) # [1, 2])
p two_sum([2, 2, 3], 4) # [0, 1])

# codewars answer below

def two_sum_CW(numbers, target)
  pair = numbers.combination(2).find{ |(a,b)| a+b == target }
  [numbers.index(pair[0]), numbers.rindex(pair[1])]
end