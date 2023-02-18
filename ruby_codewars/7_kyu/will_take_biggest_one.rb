# input: integer > 0 (n)
# output: integer (largest possible) where...
#   out_int == a * b
#   n == a + b
#   a != b

def max_int_chain(n)
  mid = n / 2
  n.even? ? ((mid-1)*(mid+1)) : (mid * (mid+1))
end

p max_int_chain(26)
