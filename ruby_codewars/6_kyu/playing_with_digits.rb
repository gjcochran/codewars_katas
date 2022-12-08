# Some numbers have funny properties. For example:

# 89 --> 8¹ + 9² = 89 * 1

# 695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

# 46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

# Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

# we want to find a positive integer k, if it exists, such that the sum of the digits of n taken to the successive powers of p is equal to k * n.
# In other words:

# Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

# If it is the case we will return k, if not return -1.

# Note: n and p will always be given as strictly positive integers.

# dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
# dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
# dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
# dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

def dig_pow(n, p)
  arr = n.to_s.chars.map(&:to_i)
  sum = 0
  arr.each_with_index do |el, idx|
    sum += el ** (p+idx)
  end
  result = sum.to_f / n 
  result.to_s.end_with?('.0') ? sum / n : -1
end

p dig_pow(89, 1)
p dig_pow(695, 2)
p dig_pow(92, 1)
p dig_pow(46288, 3)

# codewars answer was overall very similar to mine, pasted below

# def dig_pow(n, p)
#   total = n.to_s.split('').map.with_index{|d, i| d.to_i ** (p+i)}.reduce(:+)
#   total % n == 0 ? (total / n) : -1
# end