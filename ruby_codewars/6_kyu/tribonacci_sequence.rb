# similar to fib, but sums last 3 rather than last 2...
# do not start with 0 1 1 like fib...
#   instead, one of inputs is array of ints with first 3 nums
# output: array of ints with trib sequence up to n (n is a given input)

def tri(sig, n)
  return sig[n-1] if n <= 3
  tri(sig, n - 1) + tri(sig, n - 2) + tri(sig, n - 3) 
end

def tribonacci(signature, n)
  return [] if n.zero?
  results = []
  1.upto(n) do |i|
    results << tri(signature, i)
  end
  results
end


p tribonacci([1,1,1],10)

# review: works, but recursive solution is too slow to pass all CW random tests
# passed by using non-recusive method...
def tri_non(sig, n)
  n1 = sig[0]
  n2 = sig[1]
  n3 = sig[2]
  i = 4
  while i <= n
    n5 = n3
    n4 = n2
    n3 = n1 + n2 + n3
    n2 = n5
    n1 = n4
    i += 1
  end
  n3
end
