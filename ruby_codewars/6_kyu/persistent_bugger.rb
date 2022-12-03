# https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby

# Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

# For example (Input --> Output):

# 39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit)
# 999 --> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2)
# 4 --> 0 (because 4 is already a one-digit number)

def persistence(n)
  if n.to_s.size > 1
    num = n.to_s
    result = []
    loop do
      arr = (0..num.size-1).to_a
      counter = 0
      product = 1
      loop do
        product *= num[arr[counter]].to_i 
        counter += 1
        break if counter == arr.size
      end
      num = product.to_s
      result << num
      break if num.size == 1
    end
    result.size
  else
    0
  end
end

p persistence(39)
p persistence(4)
p persistence(25)
p persistence(999)
p persistence(444)

# codewars solution used recursion and the reduce method and is much simpler!

# def persistence(n)
#   n < 10 ? 0 : 1 + persistence(n.to_s.chars.map(&:to_i).reduce(:*))
# end

  # irb(main):030:0> 39.to_s.chars.map(&:to_i)
  # => [3, 9]
  # irb(main):031:0> 39.to_s.chars.map(&:to_i).reduce(:*)
  # => 27