def form(a, b, c)
  (2**a)*(3**b)*(5**c)
end

# note for future that current method def wont work
# as does not account for instances where ijk are 
# more than 1 num apart... ex i is 2 j and k are 0

def hamming(n)
  i, j, k = 0, 0, 0
  result = []

  (n).times do
    result << form(i, j, k) 
    i += 1
    result << form(i, j, k)
    j += 1
    i -= 1
    result << form(i, j, k)
    k += 1
    j -= 1
    result << form(i, j, k)
    i += 1
    j += 1
    result << form(i, j, k)
    p i, j, k
  end
  result.sort
end

p hamming(4)
