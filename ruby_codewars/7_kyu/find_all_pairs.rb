# https://www.codewars.com/kata/5c55ad8c9d76d41a62b4ede3/train/ruby

# PROBLEM:
# You are given array of integers, your task will be to count all pairs in that array and return their count.

# RULES
# Array can be empty or contain only one value; in this case return 0
# If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
# Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

# EXAMPLES
# [1, 2, 5, 6, 5, 2]  -->  2
# ...because there are 2 pairs: 2 and 5

# [1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
# ...because there are 4 pairs: 2, 20, 6 and 2 (again)


# C
# attempt 1 - didnt not account for multiple pairs of same number
# def pairs(arr)
#   pairs = {}
#   default = 1
#   arr.each do |num|
#     pairs.keys.include?(num) ? pairs[num] += 1 : pairs[num] = default
#   end
#   pairs.delete_if { |k, v| v < 2 }
#   p pairs
#   pairs.size
# end

# p pairs([1, 2, 5, 6, 5, 2])
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])

# attempt 2 # failed again as doesnt work for more than 1 extra pair
# def pairs(arr)
#   pairs = {}
#   default = 1
#   arr.each do |num|
#     pairs.keys.include?(num) ? pairs[num] += 1 : pairs[num] = default
#   end
#   pairs.delete_if { |k, v| v < 2 }
#   pairs.clone.each do |k, v|
#     if v > 2
#       counter = (v/2)-1
#       pairs["#{counter}"] = v
#       counter -= 1
#       break if counter == 0
#     end
#   end
#   pairs.size
# end

# p pairs([1, 2, 5, 6, 5, 2])
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2, 2, 2])

# attempt 3

# def pairs(arr)
#   integers = arr.select { |el| el.is_a?Numeric}

#   if integers.size > 1 && integers.size <= 1000
#     hash = integers.each_with_object({}) {|k, h| h[k] = integers.count(k)}
#     hash.delete_if {|k, v| v < 2 || k > 1000 }
#     arr1 = hash.values
#     arr2 = arr1.map {|v| v.odd? ? v -= 1 : v }
#     arr2.inject(:+) / 2

#   elsif integers.size > 1000
#     integers.slice!(1000..-1)
#     hash = integers.each_with_object({}) {|k, h| h[k] = integers.count(k)}
#     hash.delete_if {|k, v| v < 2 || k > 1000 }
#     arr1 = hash.values
#     arr2 = arr1.map {|v| v.odd? ? v -= 1 : v }
#     arr2.inject(:+) / 2
#   else
#     0
#   end
# end

# p pairs([1, 2, 5, 6, 5, 2]) 
# p pairs([1, 2, 5, 6, 5, 2, 1001, 1001, 993, 993, 993])
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2, 2, 2])
# p pairs([0, 0, 0, 0, 0, 0, 0])

# array = (0..200).to_a
# array2 = (0..100).to_a
# array3 = array.concat(array2)
# array3.sort!
# array4 = (0..1000).to_a
# array5 = array3.concat(array4)
# p array5

# p arr
# p pairs(array5)
# p array.size
# array.slice!(1000..-1)
# p array.size

# super frustrating, am receiving a nil / nomethoderror on the random codewars tests and have no idea why as they dont explain what am testing against. my solution above works for all tests that I can think of, cannot think of any situation at all where arr2 would equal nil or contain a nil value that could not be divided by 2, yet the only / method that i have in my code is on that arr2.inject(:+) line so that must be the issue with some weird edge case

# ANSWER THAT WORKS FOR ALL NUMBERS, ignoring codewars arbitrary stipulations about size and values of array not being allowed to be greater than 1000

def pairs(arr)
  if arr.size > 1
    hash = arr.each_with_object({}) {|k, h| h[k] = arr.count(k)}
    hash.delete_if {|k, v| v < 2 }
    arr1 = hash.values
    arr2 = arr1.map {|v| v.odd? ? v -= 1 : v }
    arr2.inject(:+) / 2
  else
    0
  end
end

p pairs([1, 2, 5, 6, 5, 2]) 
p pairs([1, 2, 5, 6, 5, 2, 1001, 1001, 993, 993, 993])
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2, 2, 2])
p pairs([0, 0, 0, 0, 0, 0, 0])
p pairs([1000, 1000])
p pairs([])
p pairs([54])

# forfeited and am pasting several methods that solve this problem below, for reference
# the Array#sum (or Hash#sum) method was the key to solving this problem!

# def pairs(arr)
#   arr.group_by { |x| x }.sum { |x, y| y.size / 2 }
# end

  # irb(main):035:0> arr = [1, 2, 5, 6, 5, 2]
  # => [1, 2, 5, 6, 5, 2]
  # irb(main):036:0> arr.group_by { |x| x }
  # => {1=>[1], 2=>[2, 2], 5=>[5, 5], 6=>[6]}

# def pairs(arr)
#   arr.uniq.sum { |i| arr.count(i) / 2 }
# end