# find all multiples of 3 && 5 below the number passed in 
# only count numbers one time
# return 0 if input integer is negative

def solution(number)
  return 0 if number < 0
  results = []
  3.upto(number-1) do |i|
    i % 3 == 0 || i % 5 == 0 ? results << i : next
  end
  results.uniq.sum
end

# good. but could simplify to one line
# `(1...number).select { |i| i % 3 == 0 || i % 5 == 0 }.inject(:+)`
