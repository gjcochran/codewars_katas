# https://www.codewars.com/kata/54521e9ec8e60bc4de000d6c/train/ruby

# The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array or list of integers:

# maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]
# Easy case is when the list is made up of only positive numbers and the maximum sum is the sum of the whole array. If the list is made up of only negative numbers, return 0 instead.

# Empty list is considered to have zero greatest sum. Note that the empty list or array is also a valid sublist/subarray.

# D/A
# want to find sum of every combo with first num then pop that first el off arr and find sum of every combo with second num etc

def max_sequence(arr)
  if arr.empty? || arr.select { |el| el.positive? }.empty?
    0
  else

    result = []
    index = 0
    loop do
      result << arr[index]
      break if arr.size == 1

      counter = index + 1
      loop do
        result << arr[index..counter].sum
        counter += 1
        break if counter == arr.size 
      end
      arr.shift
    end
    result.max
  end
end

p max_sequence([]) #=> 0)
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) #=> 6)
p max_sequence([11]) #=> 11)
p max_sequence([-32]) #=> 0)
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) #=> 12)

# codewars answer below

# def max_sequence(array)
#   (1..array.size).map { |i| array.each_cons(i).map(&:sum) }.flatten.push(0).max
# end

# codewars answer explained
# The map makes an array of the sums of every possible subarray.
# Flatten makes sure we have a list of sums rather than a list of arrays of sums.
# The push(0) makes sure that the maximum value will never be less than zero.
# And max takes the max.
# https://ruby-doc.org/core-2.5.1/Enumerable.html#method-i-each_cons
  # Iterates the given block for each array of consecutive <n> elements.