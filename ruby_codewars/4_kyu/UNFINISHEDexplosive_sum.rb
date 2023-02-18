# https://www.codewars.com/kata/52ec24228a515e620b0005ef/train/ruby

# In number theory and combinatorics, a partition of a positive integer n, also called an integer partition, is a way of writing n as a sum of positive integers. Two sums that differ only in the order of their summands are considered the same partition. If order matters, the sum becomes a composition. For example, 4 can be partitioned in five distinct ways:

# 4
# 3 + 1
# 2 + 2
# 2 + 1 + 1
# 1 + 1 + 1 + 1

# Examples
# Basic
# exp_sum(1) # 1
# exp_sum(2) # 2  -> 1+1 , 2
# exp_sum(3) # 3 -> 1+1+1, 1+2, 3
# exp_sum(4) # 5 -> 1+1+1+1, 1+1+2, 1+3, 2+2, 4
# exp_sum(5) # 7 -> 1+1+1+1+1, 1+1+1+2, 1+1+3, 1+2+2, 1+4, 5, 2+3

# exp_sum(10) # 42
# Explosive
# exp_sum(50) # 204226
# exp_sum(80) # 15796476
# exp_sum(100) # 190569292

def exp_sum(n)
  result = []
  n.downto(1) do |i|
    arr = (1..i).to_a
    arr.map { |num| result << [n - i, num, i - num] }
    # first_pass.each { |sub| result << [sub[0], exp_sum(sub[1])] } 
  end
  result.map(&:sort).uniq
end

# p exp_sum(1)
# p exp_sum(2)
# p exp_sum(3)
p exp_sum(4)
# p exp_sum(5)
# p exp_sum(10)

# NOTE TO TRY PARTITION METHOD

# first_pass = arr.map { |num| [num, n - num] }
# second_half = first_pass.select { |sub| sub[1].even? ? sub[1] <= (n / 2) : sub[1] <= ((n / 2) - 1) }
  # p second_half

  # first_half = first_pass.select { |sub| sub[1].even? ? sub[1] > (n / 2) : sub[1] > ((n / 2) - 1) }
# first_pass.map(&:sort).uniq.size

# -------------------------------------------------------- 

# the below method does not work! except for for 3, 4, and 5... just wanted to explore with divmod
# def exp_sum(n)
#   arr = (1..n).to_a
#   result = []
#   arr.each do |num|
#     sub = n.divmod(num)
#     result << [sub[0] * num, sub[1]]
#     holding = []
#     num.times { holding << 1 }
#     holding << sub[1]
#     result << holding
#     holding2 = []
#     (sub[1]).times { holding2 << 1 }
#     holding2 << (sub[0] * num)
#     result << holding2
#     holding3 = []
#     num.times { holding3 << sub[0] }
#     holding3 << sub[1]
#     result << holding3
#     holding4 = []
#     num.times { holding4 << 1 }
#     holding4 << sub[0]
#     result << holding4

#   end
#   result = result.uniq.select { |sub| sub.sum == n && sub.size <= n && sub.size > 1 }
#   result = result.map(&:sort).uniq
#   p result
#   result.size
# end

# p exp_sum(1)
# p exp_sum(2)
# p exp_sum(3)
# p exp_sum(4) # 5 -> 1+1+1+1, 1+1+2, 1+3, 2+2, 4
# # [[0, 4], [0, 2, 2], [1, 3], [1, 1, 1, 1]]
 
# p exp_sum(5) # 7 -> 1+1+1+1+1, 1+1+1+2, 1+1+3, 1+2+2, 1+4, 5, 2+3
# # [[0, 5], [1, 4], [1, 2, 2], [2, 3], [1, 1, 1, 2], [1, 1, 3], [1, 1, 1, 1, 1]]
# p exp_sum(10)