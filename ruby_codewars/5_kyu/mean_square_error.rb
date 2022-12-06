# https://www.codewars.com/kata/51edd51599a189fe7f000015/train/ruby

# Complete the function that

# accepts two integer arrays of equal length
# compares the value each member in one array to the corresponding member in the other
# squares the absolute value difference between those two values
# and returns the average of those squared absolute value difference between each member pair.
# Examples
# [1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
# [10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
# [-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2

def solution(arr1, arr2)
  counter = 0
  sum = 0
  loop do 
    sum += ((arr1[counter] - arr2[counter]).abs ** 2)
    counter += 1
    break if counter == arr1.size
  end
  sum.to_f / arr1.size
end

p solution([1, 2, 3], [4, 5, 6])
p solution([10, 20, 10, 2], [10, 25, 5, -2])
p solution([-1, 0], [0, -1])

# several other options from codewars below, for reference...

# def solution (arr1, arr2)
#   arr1.map.with_index { |n, i| (n - arr2[i]).abs ** 2 }.sum.fdiv(arr1.length)
# end

# def solution (arr1, arr2)
#   arr1.zip(arr2).sum { |a, b| (a-b)**2 } .fdiv(arr1.size)
# end