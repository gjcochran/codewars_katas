# given integer, return largest prime integer with 2 even digits that is < input

# how to calculate if prime?
# will codewars allow for using the Prime class...
# with require 'prime' then have a prime? method

require 'prime'
def f(n)
  counter = (n * 0.8).to_i
  arr = []
  while counter < n - 1
    counter += 1
    next unless counter.prime?
    temp = counter.to_s.chars.select { |i| i.to_i.even? }
    arr << [temp.join.to_i, counter]
  end
  arr.max.last
end

p f(1000)
p f(1210)
p f(10000)
p f(500)
p f(487)
p f(5915)

# review: works. codewars answer below for ref
# note that the (n-1) after each if the upper bound for the Prime.each method
# Prime.each(n-1).max_by { |i| [i.digits.count(&:even?), i] }
