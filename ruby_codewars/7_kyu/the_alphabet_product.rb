# input: array of 8 integers
#   not in order.. A B C D A*B B*C C*D D*A
# output: what is the value of D?
# rules: A < B < C < D

def alphabet(arr)
  test = arr.sort
  hash = (1..8).each_with_object ({}) { |el, h| h[el] = 0 }
  hash[1], hash[2] = test.shift, test.shift
  hash[5] = test.delete_at(test.index(hash[1] * hash[2]))
  hash[3] = test.shift
  hash[6] = test.delete_at(test.index(hash[2] * hash[3]))
  hash[4] = test.shift
end
p alphabet([20, 10, 6, 5, 4, 3, 2, 12])

#my solution is not elegant but works, not that random test cases are broken as dont fulfill kata conditions...
