# input: array of integers 
#   min length of 3
#   only one odd int || only one even int
# output: return the only odd||even int in the input array

def find_outliers(integers)
  (integers.select { |n| n.odd? }.size > 1) ? integers.select(&:even?).first : integers.select(&:odd?).first
end

p find_outliers([2, 4, 0, 100, 4, 11, 2602, 36])

# works. several other methods are more simple...
# 
# integers.partition(&:odd?).find(&:one?).first
#
# integers.count(&:even?) > 1 ? integers.find(&:odd?) : integers.find(&:even?)
