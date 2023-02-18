# F(n) = F(n-1) + F(n-2) [F(0) = 0 && F(1) = 1 ]
# given: integer, product
# return: array with 3 elements
#   either:
#     two consecutive fib nums that product of == input ; true
#     closest "                                " that is just > input ; false

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


def fib_rec(n)
  return 0 if n.zero?
  return 1 if n == 1
  fib(n-1) + fib(n-2)
end

def productFib(prod)
  num = 2  
  loop do
    if (fib(num-2) * fib(num-1)) >= prod
      break
    else
      num += 1 
    end
  end
  
  (fib(num-2) * fib(num-1)) == prod ? [fib(num-2), fib(num-1), true] : [fib(num-2), fib(num-1), false]
end

p productFib(714)

# review: worked only with non-recursive method, was too slow otherwise
# in classic fashion the codewars ideal answer is one method and significantly more simple
#
# a, b = [0, 1]
# while prod > a * b
#   a, b = [b, a + b]
# end
# [a, b, prod == a * b]
