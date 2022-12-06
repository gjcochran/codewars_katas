# https://www.codewars.com/kata/514b92a657cdc65150000006/train/ruby

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in. Additionally, if the number is negative, return 0 (for languages that do have them).

# Note: If the number is a multiple of both 3 and 5, only count it once.



def solution(num)
  result = []
  1.upto(num-1) { |num| result << num if num % 3 == 0 || num % 5 == 0 }
  result.inject(:+)
end

p solution(10) #=>  23
p solution(20) #=>  78
p solution(200) #=> 9168

# codewars solution below for reference
# def solution(number)
#   (1...number).select {|i| i%3==0 || i%5==0}.inject(:+)
# end

  # irb(main):001:0> (1..10).to_a
  # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  # irb(main):002:0> (1...10).to_a
  # => [1, 2, 3, 4, 5, 6, 7, 8, 9]