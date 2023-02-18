# input: positive integer
# output: positive integer
#   rearrange digits of input and what is next largest num with those digits
#   ex. 513 --> 531

def next_bigger(n)
  options = []
  n.digits.permutation(n.digits.size) { |c| options << c.join.to_i if c.join.to_i > n }
  options.empty? ? -1 : options.min
end

p next_bigger(12)
p next_bigger(513)
p next_bigger(2017)
p next_bigger(414)
p next_bigger(144)

# review: have messed around in cw with many versions of this but still too slow
# i suspect that cant use permutation method at all, refactor at a later date with dif algo
