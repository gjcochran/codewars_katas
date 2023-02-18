# input: 2 arrays of integers of equal length
# output: integer
#   average of..
#     for each el in arrays
#     at same index compare
#     difference of 
#     abs of that difference
#     squared

def solution(arr1, arr2)
arr1.map.with_index { |_, idx| (arr2[idx] - arr1[idx]).abs ** 2 }.sum / arr1.size.to_f
end
