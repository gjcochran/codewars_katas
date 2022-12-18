# https://www.codewars.com/kata/5993fb6c4f5d9f770c0000f2/train/ruby

# Please write a function that sums a list, but ignores any duplicate items in the list.

# For instance, for the list [3, 4, 3, 6] , the function should return 10.

def sum_no_duplicates(arr)
  arr.select { |el| arr.count(el) == 1 }.sum
end

p sum_no_duplicates([1, 1, 2, 3]) # 5)
p sum_no_duplicates([1, 1, 2, 2, 3]) # 3)