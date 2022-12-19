# https://www.codewars.com/kata/5279f6fe5ab7f447890006a7/train/ruby

# In this kata, you will write a function that returns the positions and the values of the "peaks" (or local maxima) of a numeric array.

# For example, the array arr = [0, 1, 2, 5, 1, 0] has a peak at position 3 with a value of 5 (since arr[3] equals 5).

# The output will be returned as an object with two properties: pos and peaks. Both of these properties should be arrays. If there is no peak in the given array, then the output should be {pos: [], peaks: []}.

# Example: pickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) should return {pos: [3, 7], peaks: [6, 3]} (or equivalent in other languages)

# All input arrays will be valid integer arrays (although it could still be empty), so you won't need to validate the input.

# The first and last elements of the array will not be considered as peaks (in the context of a mathematical function, we don't know what is after and before and therefore, we don't know if it is a peak or not).

# Also, beware of plateaus !!! [1, 2, 2, 2, 1] has a peak while [1, 2, 2, 2, 3] and [1, 2, 2, 2, 2] do not. In case of a plateau-peak, please only return the position and value of the beginning of the plateau. For example: pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]} (or equivalent in other languages)

def pick_peaks(arr)
  rel = arr.map.with_index { |el, idx| [el <=> arr[idx-1], idx] }
  # p rel
  indexes = rel[0...-1].select.with_index do |el, idx| # [0...-1] allows one to iterate through array without the last element so that am not comparing to nil and generating an error!!
    n = arr[el[1]] - 1
    el[0] > rel[idx+1][0]  && arr[idx+1..-1].any? { |el| el < arr[idx] } 
  end
  final = indexes.map { |el| [el[1], arr[el[1]]]}.delete_if { |el| el[0] == 0 || el[0] == arr.size - 2 }
  positions = final.map { |el| el[0] }
  peaks = final.map { |el| el[1] }
  result = {"pos" => positions, "peaks" => peaks}
end

p pick_peaks([1,2,3,6,4,1,2,3,2,1])
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3])
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1])
p pick_peaks([2,1,3,1,2,2,2,2,1])
p pick_peaks([2,1,3,1,2,2,2,2])

# it('should support finding peaks') do
#   Test.assert_equals(pick_peaks([1,2,3,6,4,1,2,3,2,1]), {"pos"=>[3,7], "peaks"=>[6,3]})
# end
# it('should support finding peaks, but should ignore peaks on the edge of the array') do
#   Test.assert_equals(pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]), {"pos"=>[3,7], "peaks"=>[6,3]})
# end
# it('should support finding peaks; if the peak is a plateau, it should only return the position of the first element of the plateau') do
#   Test.assert_equals(pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]), {"pos"=>[3,7,10], "peaks"=>[6,3,2]})
# end
# it('should support finding peaks; if the peak is a plateau, it should only return the position of the first element of the plateau') do
#   Test.assert_equals(pick_peaks([2,1,3,1,2,2,2,2,1]), {"pos"=>[2,4], "peaks"=>[3,2]})
# end
# it('should support finding peaks, but should ignore peaks on the edge of the array') do
#   Test.assert_equals(pick_peaks([2,1,3,1,2,2,2,2]), {"pos"=>[2], "peaks"=>[3]})
# end

# works for all but 1 test!
# [1, 2, 5, 4, 3, 2, 3, 6, 4, 1, 2, 3, 3, 4, 5, 3, 2, 1, 2, 3, 5, 5, 4, 3]
#  0  1  2* 3  4  5  6  7* 8  9  10 11 12 13 14*15 16 17 18 19 20*21 22 23
# Expected: {"pos"=>[2, 7, 14, 20], "peaks"=>[5, 6, 5, 5]}, instead got: {"pos"=>[2, 7, 11, 14, 20, 21], "peaks"=>[5, 6, 3, 5, 5, 5]}
