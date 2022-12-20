# https://www.codewars.com/kata/585d7d5adb20cf33cb000235/train/ruby

# There is an array with some numbers. All numbers are equal except for one. Try to find it!

# find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
# find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
# It’s guaranteed that array contains at least 3 numbers.

# The tests contain some very huge arrays, so think about performance.

# def find_uniq(arr)
#   arr.select { |el| arr.count(el) == 1 }.first
# end

# p find_uniq([1,1,1,1,0]) # 0)
# p find_uniq([ 1, 1, 1, 2, 1, 1 ]) # 2);
# p find_uniq([ 0, 0, 0.55, 0, 0 ]) # 0.55);

# this code works but not not huge arrays so needs to be refactored

# attempt 2

def find_uniq(arr)
  arr.group_by { |i| i }.select { |k,v| v.size == 1}.values.flatten.first
end

p find_uniq([1,1,1,1,0]) # 0)
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) # 2);
p find_uniq([ 0, 0, 0.55, 0, 0 ]) # 0.55);

# codewars answer
# def find_uniq(arr)
#   arr.uniq.each { |x| return x if arr.count(x) == 1 }
# end
