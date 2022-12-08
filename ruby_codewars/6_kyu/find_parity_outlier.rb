# https://www.codewars.com/kata/5526fc09a1bbd946250002dc/train/ruby

# you are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.

# Examples
# [2, 4, 0, 100, 4, 11, 2602, 36]
# Should return: 11 (the only odd number)

# [160, 3, 1719, 19, 11, 13, -21]
# Should return: 160 (the only even number)

def find_outlier(ints)
  odds = ints.reject { |n| n.even? }
  evens = ints.reject { |n| n.odd? }
  odds.size > evens.size ? evens.join.to_i : odds.join.to_i
end

p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36])

# several codewars answers below that took a slightly different approach pasted for future reference

def find_outlier(integers)
  integers.partition(&:odd?).find(&:one?).first
end

    # irb(main):002:0> ints = [2, 4, 0, 100, 4, 11, 2602, 36]
    # => [2, 4, 0, 100, 4, 11, 2602, 36]
    
    # irb(main):004:0> a = ints.partition(&:odd?)
    # => [[11], [2, 4, 0, 100, 4, 2602, 36]]

    # irb(main):005:0> a.find(&:one?)
    # => [11]

def find_outlier(integers)
  integers.count(&:even?) > 1 ? integers.find(&:odd?) : integers.find(&:even?)
end

    # irb(main):008:0> ints
    # => [2, 4, 0, 100, 4, 11, 2602, 36]

    # irb(main):006:0> ints.find(&:odd?)
    # => 11
    # irb(main):007:0> ints.find(&:even?)
    # => 2