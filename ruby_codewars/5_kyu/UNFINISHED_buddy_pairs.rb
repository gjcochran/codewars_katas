# proper divisors of an integer n and all divisors except for n itself
# "buddy" integers are positive integers such that...
#  the sum of the proper divisors of each number > by 1 the sum of proper divisors of other
# e.g.
#   n = 48
#   m = 75
#   n_divisors = [1, 2, 3, 4, 6, 8, 12, 16, 24]
#   n_divisors.sum == 75
#   m_divisors = [1, 3, 5, 15, 25]
#   m_divisors.sum == 49
#     therefore 48 and 75 are buddies

# input: two positive integers ... start and limit
# output: the first buddy pair between start and limit
# rules: only n has to be between start and limit
#         m must be greater than n
#         start n at start and end at limit (ie inputs are inclusive to testing)
#       return `nil` if no buddy pairs exists

def sum(num)
  result = [] 
  (1..num).each do |i|
    div_arr = num.divmod(i)
    div_arr.last == 0 ? result << i : next
  end
  result.uniq.sum - num
end

def buddy(start, limit)
  n = start
  result = []
  while n <= limit
    n_div_sum = sum(n)
    if (n_div_sum - 1) <= n
      n += 1
    elsif sum(n_div_sum - 1) == n + 1
      result << n << (n_div_sum - 1)
      break
    else
      n += 1
    end
  end
  result.empty? ? nil : result
end

p sum(48)
p buddy(47, 50)
p buddy(10, 50)
p buddy(2177, 4357)
p buddy(57345, 90061)
p buddy(1071625, 1103735)

# status: code works on first 4 tests, based on sum method
# will work on last 2... but iterating 1 by 1 takes 
# far too long therefore need to refactor
