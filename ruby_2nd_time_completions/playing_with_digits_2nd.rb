# input: positive integer n and positive integer p
# output: integer k
# if n broken up into each int char
#   successive sqs of those chars starting with p is equal to n * k 

def dig_pow(n, p)
  arr = n.to_s.chars.map(&:to_i)
  sqd = arr.map.with_index { |num, idx| num ** (p + idx) }.sum
  div = sqd.divmod(n)
  p div
  div[0].positive? && div[1].zero? ? div[0] : -1
end

p dig_pow(89, 1)
p dig_pow(92, 1)
p dig_pow(695, 2)
p dig_pow(46288, 3)
