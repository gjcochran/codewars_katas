# https://www.codewars.com/kata/521c2db8ddc89b9b7a0000c1

# Given an n x n array, return the array elements arranged from outermost elements to the middle element, traveling clockwise.

# array = [[1,2,3],
#          [4,5,6],
#          [7,8,9]]
# snail(array) #=> [1,2,3,6,9,8,7,4,5]


def snail(arr)
  wk = arr.flatten
  n = arr.first.size
  result = wk[0..n-1] + wk
end

array = [[1,2,3],
         [4,5,6],
         [7,8,9]]

array2 = [['a', 'b', 'c', 'd'],
          ['e', 'f', 'g', 'h'],
          ['i', 'j', 'k', 'l']
          ['m', 'n', 'o', 'p']]
#   %w(a b c d e f  g  h  i  j  k  l  m  n  o  p)          
#=> %w(a b c d h l  p  o  n  m  i  e  f  g  k  j) 
    #  1 2 3 4 5 6  7  8  9  10 11 12 13 14 15 16
    #  1 2 3 4 8 12 16 15 14 13 9  5  6  7  11 10 
    #  0 1 2 3 7 11 15 14 13 12 8  4  5  6  10  9 
# n=4  [      ][      ][       ][][       ][     ]

# arr[0..n] + (n-1).times do n*2-1 + ... 


    n = arr.first.size        

p array.flatten
p array.first.size


# p snail(array)