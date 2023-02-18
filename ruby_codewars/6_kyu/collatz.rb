# if n.even? ... n / 2
# if n.odd? ... 3n + 1
# end when n == 1

def collatz(n)
  result = []
  num = n
  loop do
    result << num
    break if num == 1
    
    if num.odd?
      num = 3 * num + 1
    else
      num = num / 2
    end
  end
  result.join("->")
end

p collatz(3)
