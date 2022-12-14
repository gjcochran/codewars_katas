# https://www.codewars.com/kata/54da5a58ea159efa38000836

# Given an array of integers, find the one that appears an odd number of times.

# There will always be only one integer that appears an odd number of times.

# Examples
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

def find_it(arr)
  arr.select { |el| arr.count(el).odd? }.uniq.join.to_i
end

p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) # 5)
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) # -1)
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) # 5)
p find_it([10]) # 10)
p find_it([1,1,1,1,1,1,10,1,1,1,1]) # 10)


# codewars answer below
def find_it_v2(seq)
  seq.detect { |n| seq.count(n).odd? }
end

p find_it_v2([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) # 5)

# https://docs.ruby-lang.org/en/3.1/Enumerable.html#method-i-detect
# Enumerable#detect returns the first element for which the block returns a truthy value.
