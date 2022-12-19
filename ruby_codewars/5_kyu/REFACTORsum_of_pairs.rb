# https://www.codewars.com/kata/54d81488b981293527000c8f/train/ruby

# Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

# If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

# sum_pairs([11, 3, 7, 5],         10)
# #              ^--^      3 + 7 = 10
# == [3, 7]

# sum_pairs([4, 3, 2, 3, 4],         6)
# #          ^-----^         4 + 2 = 6, indices: 0, 2 *
# #             ^-----^      3 + 3 = 6, indices: 1, 3
# #                ^-----^   2 + 4 = 6, indices: 2, 4
# #  * the correct answer is the pair whose second value has the smallest index
# == [4, 2]

# sum_pairs([0, 0, -2, 3], 2)
# #  there are no pairs of values that can be added to produce 2.
# == None/nil/undefined (Based on the language)

# sum_pairs([10, 5, 2, 3, 7, 5],         10)
# #              ^-----------^   5 + 5 = 10, indices: 1, 5
# #                    ^--^      3 + 7 = 10, indices: 3, 4 *
# #  * the correct answer is the pair whose second value has the smallest index
# == [3, 7]
# Negative numbers and duplicate numbers can and will appear.

# NOTE: There will also be lists tested of lengths upwards of 10,000,000 elements. Be sure your code doesn't time out.

def sum_pairs(ints, s)
  nums = ints
  result = []
  count = 0
  loop do
    counter = count + 1
    loop do
      a = nums[count]
      b = nums[counter]
      sum = a + b
      result << [counter, a, b] if sum == s
      counter += 1
      break if counter == nums.size
    end
    count += 1
    break if count == nums.size - 1
  end
  return nil if result.empty?
  result.sort.first.shift
  result.sort.first
end




# tests
l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]


p sum_pairs(l1, 8) == [1, 7] # "Basic: ["+l1.join(", ")+"] should return [1, 7] for sum = 8")
p sum_pairs(l2, -6) == [0, -6] # "Negatives: ["+l2.join(", ")+"] should return [0, -6] for sum = -6")
p sum_pairs(l3, -7) == nil # "No Match: ["+l3.join(", ")+"] should return nil for sum = -7")
p sum_pairs(l4, 2) == [1, 1] # "First Match From Left: ["+l4.join(", ")+"] should return [1, 1] for sum = 2 ")
p sum_pairs(l5, 10) == [3, 7] # "First Match From Left REDUX!: ["+l5.join(", ")+"] should return [3, 7] for sum = 10 ")
p sum_pairs(l6, 8) == [4, 4] # "Duplicates: ["+l6.join(", ")+"] should return [4, 4] for sum = 8")
p sum_pairs(l7, 0) == [0, 0] # "Zeroes: ["+l7.join(", ")+"] should return [0, 0] for sum = 0")
p sum_pairs(l8, 10) == [13, -3] # "Subtraction: ["+l8.join(", ")+"] should return [13, -3] for sum = 10")

# THIS WORKS FOR ALL SHORT TESTS, BUT TAKES TOO LONG FOR THE LONG TESTS AND THEREFORE NEEDS TO BE REFACTORED IN ORDER TO BE ABLE TO SUMBIT TO CODESWARS