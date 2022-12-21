# https://www.codewars.com/kata/51ba717bb08c1cd60f00002f/train/ruby

# ------------------ PROMPT -----------------------
# A format for expressing an ordered list of integers is to use a comma separated list of either
  # individual integers
  # or a range of integers denoted by the starting integer separated from the end integer in the range by a dash, '-'. The range includes all integers in the interval including both endpoints. It is not considered a range unless it spans at least 3 numbers. For example "12,13,15-17"

# Complete the solution so that it takes a list of integers in increasing order and returns a correctly formatted string in the range format.

# Example:

# solution([-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20])
# returns "-10--8,-6,-3-1,3-5,7-11,14,15,17-20"

#  ------------------ UNDERSTAND THE PROBLEM -----------------------
# input: 
#   - array (of integers)
#     - in increasing order
# output:
#   - string (of integers as strings)
# rules:
#   - any ranges of integers from condensed to format numx-numy
#     - ex. -10, -9, -8 becomes -10--8
#     - a range must contain minimum 3 numbers to be condensed
#   - , between ranges and numbers not part of range

#  ------------------ EXAMPLES / TEST CASES -----------------------
# two examples are given
# assumptions
#   1. input will always be an array
#   2. input array will always only contain integers
#   3. integers in input array will always be in increasing order (lowest num to highest)
  # 4. there are no duplicate integers in the array 
# if assumptions are invalid, then will need additional test cases, but no way to verify until have submitted original solution to codewars


# solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) #=> "-6,-3-1,3-5,7-11,14,15,17-20")
# solution([-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) #=> "-10--8,-6,-3-1,3-5,7-11,14,15,17-20"

#  ------------------ DATA STRUCTURES -----------------------
# input can remain an array of integers

#  ------------------ ALGORITHM / ABSTRACTION -----------------------
# - given an array of integers
# - specify 2 return empty arrays to shovel return values into (one will feed the other and then reset)
# - iterate using a loop and compare each array element to the index+1 element
#   - if (el - arr[idx+1]).abs == 1 then convert to string and add both elements to reset array
#     else add reset array to return array, convert idx+1 to string + add the individual number to the return array, and reset inner result array 
#  - either way... iterate through each element until counter == arr.size - 1
#  - once have return array in full, map 
#     - map breakdown: 
#       TRICKIEST PART 
#       if is an array
#         gsub all elements that are not first and last to '-' 
            # there will be duplicates that this will also take care of 
#       else simply add string elements to map return   
#  - join mapped array     


#  ------------------ CODE -----------------------
# stuff didn't account for once started coding...
  # how to only add to outer array as array if is minimum range of 3
  # how to deal with multiple ranges in a row
  # didn't account for the fact that map returns an array so cant use gsub on arrays
  # didn't account for how to handle gsub with negatives as a negative looks the same as a dash

def solution(list)
  arr = list
  outer = []
  inner = []
  counter = 0
  loop do
    if (arr[counter] - arr[counter + 1]).abs == 1
      inner << arr[counter].to_s << arr[counter + 1].to_s
    else
      if inner.size > 2
        outer << inner
      else
        inner.each { |el| outer << el }
      end
      outer << arr[counter].to_s unless outer.flatten.include?(arr[counter].to_s)
      inner = []
    end
    counter += 1
    if counter == arr.size - 1
      if inner.size > 2
        outer << inner 
      elsif inner.size == 1 || inner.size == 2
        inner.each { |el| outer << el }
      end
      if (arr[counter] - arr[counter - 1]).abs != 1
        outer << arr[counter].to_s
      end
      break
    end
  end
  
  outer.map do |el|
    if el.is_a?(String)
      el
    else
      el.uniq.map do |num|
        if num == el.first
          num
        elsif num == el.last
          num
        else
          ' '
        end
      end.join.gsub(/ +/, '-')
    end
  end.join(',')
end

# p solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) == "-6,-3-1,3-5,7-11,14,15,17-20"

# p solution([-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) 
# p solution([-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) == "-10--8,-6,-3-1,3-5,7-11,14,15,17-20"

p solution([-57, -56, -55, -54, -53, -51, -50, -48, -46, -45, -43]) 
p solution([-57, -56, -55, -54, -53, -51, -50, -48, -46, -45, -43]) == "-57--53,-51,-50,-48,-46,-45,-43"

p solution([-88, -87, -85, -83, -81, -80, -79, -78, -77, -76, -74, -72, -70, -69, -67, -65, -63, -62, -60, -58, -56, -54, -52, -50, -49]) == "-88,-87,-85,-83,-81--76,-74,-72,-70,-69,-67,-65,-63,-62,-60,-58,-56,-54,-52,-50,-49"

# CODEWARS OPTIMAL SOLUTION BELOW... USES CHUNK_WHILE METHOD

def solution_CW(list)
  list.chunk_while { |n1, n2| n2 - n1 == 1 }
      .map { |set| set.size > 2 ? "#{set.first}-#{set.last}" : set }
      .join(',')
end

# https://ruby-doc.org/3.1.2/Enumerable.html#method-i-chunk_while
# chunk_while {|element, next_element| ... } → enumerator
# The returned Enumerator uses the block to partition elements into arrays (“chunks”); it calls the block with each element and its successor; begins a new chunk if and only if the block returns a truthy value:

# Example:

# a = [1, 2, 4, 9, 10, 11, 12, 15, 16, 19, 20, 21]
# e = a.chunk_while {|i, j| j == i + 1 }
# e.each {|array| p array }
# Output:

# [1, 2]
# [4]
# [9, 10, 11, 12]
# [15, 16]
# [19, 20, 21]