def isPrime(num)
  return false if num.abs == 1
  return true if num.abs == 2 
  return false if num.even?
  2.upto(40) do |i|
    if num == i
      next
    elsif num % i == 0
      return false
    else
      next
    end
  end
  true
end

p isPrime(4)
p isPrime(100)
p isPrime(999)
p isPrime(958297)
p isPrime(-7)
p isPrime(-7)
p isPrime(-7)

# review: not so simple as just going up to 40... but would take 
# way too long to test all the way up to num.abs
