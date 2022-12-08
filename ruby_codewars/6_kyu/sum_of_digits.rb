# https://www.codewars.com/kata/541c8630095125aba6000c00/train/ruby

# Digital root is the recursive sum of all the digits in a number.

# Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way until a single-digit number is produced. The input will be a non-negative integer.

# Examples
#     16  -->  1 + 6 = 7
#    942  -->  9 + 4 + 2 = 15  -->  1 + 5 = 6
# 132189  -->  1 + 3 + 2 + 1 + 8 + 9 = 24  -->  2 + 4 = 6
# 493193  -->  4 + 9 + 3 + 1 + 9 + 3 = 29  -->  2 + 9 = 11  -->  1 + 1 = 2

def digital_root(n)
  sum = 0
  loop do
    arr = n.to_s.chars
    sum = arr.map(&:to_i).inject(:+)
    if sum.to_s.size > 1
      n = sum
    else 
      break
    end
  end
  sum
end

p digital_root(16) # =>, 7)
p digital_root(942)# => 6)
p digital_root(132189)# => 6)
p digital_root(493193)# => 2)

# couldnt figure out how to do recursively... my loop/do solution worked well. recursive solution copy/pasted from codwars below

# def digital_root(n)
#   n < 10 ? n : digital_root(n.digits.sum)
# end

  # irb(main):012:0> n = 942
  # => 942
  # irb(main):013:0> n.digits
  # => [2, 4, 9]
  # irb(main):014:0> n.digits.sum
  # => 15