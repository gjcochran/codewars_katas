def fib(n)
 return 1 if n == 1 || n == 2
 num1 = 1
 num2 = 1
 i = 3
 while i <= n
   num3 = num2
   num2 = num1 + num2
   num1 = num3
   i += 1
 end
 num2
end

def fib_recurve(n)
  return 0 if n.zero?
  return 1 if n == 1
  fib(n-1) + fib(n-2)
end

def perimeter(n)
  sums = []
  1.upto(n+1) do |i|
    sums << fib(i)
  end
  4 * sums.sum 
end

p perimeter(5)

# note that tried this both with recursive and (faster) non-recursive
# versions of fibonacci sequence and is still too slow to pass all codewars tests...
