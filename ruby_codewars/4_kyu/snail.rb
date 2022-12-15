# https://www.codewars.com/kata/521c2db8ddc89b9b7a0000c1

# Given an n x n array, return the array elements arranged from outermost elements to the middle element, traveling clockwise.

# array = [[1,2,3],
#          [4,5,6],
#          [7,8,9]]
# snail(array) #=> [1,2,3,6,9,8,7,4,5]

# P
#   %w(a b c d e f  g  h  i  j  k  l  m  n  o  p)          
#=> %w(a b c d h l  p  o  n  m  i  e  f  g  k  j) 
    #  1 2 3 4 5 6  7  8  9  10 11 12 13 14 15 16
    #  1 2 3 4 8 12 16 15 14 13 9  5  6  7  11 10 
    #  0 1 2 3 7 11 15 14 13 12 8  4  5  6  10  9 


# D/A
# loop with top across, right down, bottom across, left up
# for each of these 4 options, push to a result array and remove from the input array of arrays


def snail(arr)
  result = []
  n = arr.first.size
  loop do
    #1
    result << arr.delete_at(0)
    break if arr.empty?
    #2
    result << arr.map(&:last)
    arr.each { |sub| sub.delete_at(-1) }
    break if arr.empty?
    #3
    result << arr[-1].reverse
    arr.pop
    break if arr.empty?
    #4
    result << arr.map(&:first).reverse
    arr.each { |sub| sub.delete_at(0) }
    break if arr.empty?
  end
  result.flatten
end

array = [[1,2,3],
         [4,5,6],
         [7,8,9]]


p snail(array) # works

array2 = [['a', 'b', 'c', 'd'],
          ['e', 'f', 'g', 'h'],
          ['i', 'j', 'k', 'l'],
          ['m', 'n', 'o', 'p']]

p snail(array2) # works

arr3 = [[1, 2, 3, 4, 5], 
        [6, 7, 8, 9, 10], 
        [11, 12, 13, 14, 15], 
        [16, 17, 18, 19, 20], 
        [21, 22, 23, 24, 25]]

p snail(arr3)

# CODEWARS SOLUTIONS WERE VERY SIMPLE! USED ARRAY SHIFT AND ARRAY TRANSPOSE METHODS

# def snail(array)
#   array.empty? ? [] : array.shift + snail(array.transpose.reverse)
# end

# def snail(array)
#   result = []
#   while array.flatten.any?
#     result << array.shift
#     array = array.transpose.reverse
#   end
#   result.flatten
# end

# https://ruby-doc.org/core-3.1.2/Array.html#method-i-shift
# Removes and returns leading elements.
# When no argument is given, removes and returns the first element

# https://ruby-doc.org/core-3.1.2/Array.html#method-i-transpose
# Transposes the rows and columns in an Array of Arrays; the nested Arrays must all be the same size:

# a = [[:a0, :a1], [:b0, :b1], [:c0, :c1]]
# a.transpose # => [[:a0, :b0, :c0], [:a1, :b1, :c1]]




