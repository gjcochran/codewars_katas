# https://www.codewars.com/kata/551f23362ff852e2ab000037/train/ruby
# ------------------ PROMPT -----------------------
# Imagine that you have a pyramid built of numbers, like this one here:

#    /3/
#   \7\ 4 
#  2 \4\ 6 
# 8 5 \9\ 3

# Here comes the task...
# Let's say that the 'slide down' is the maximum sum of consecutive numbers from the top to the bottom of the pyramid. As you can see, the longest 'slide down' is 3 + 7 + 4 + 9 = 23

# Your task is to write a function that takes a pyramid representation as argument and returns its' largest 'slide down'. For example:

# * With the input `[[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]]`
# * Your function should return `23`.

# given tests:
# longest_slide_down(
#   [[3],
#    [7, 4],
#    [2, 4, 6],
#    [8, 5, 9, 3]]),
#    23
# a = [[3], [7,4], [2,4,6], [8,5,9,3]]
# longest_slide_down(
#   [[75],
#    [95, 64],
#    [17, 47, 82],
#    [18, 35, 87, 10],
#    [20,  4, 82, 47, 65],
#    [19,  1, 23, 75,  3, 34],
#    [88,  2, 77, 73,  7, 63, 67],
#    [99, 65,  4, 28,  6, 16, 70, 92],
#    [41, 41, 26, 56, 83, 40, 80, 70, 33],
#    [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
#    [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
#    [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
#    [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
#    [63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
#    [ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23]]),
#    1074,
#  ------------------ UNDERSTAND THE PROBLEM -----------------------
# input: an array of arrays
#   - first inner array is of size 1
#   - each subsequent array is of size += 1
#     - therefore for array of arrays containing 4 arrays (ie arr.size == 4), the last inner array will also have a size of 4
# output: integer
#   - "largest slide down"
#   for a = [[3], [7,4], [2,4,6], [8,5,9,3]]
    #    /3/
    #   \7\ 4 
    #  2 \4\ 6 
    # 8 5 \9\ 3
    # option1: 0, 0/1 ..      3
    #             0, 0/1 ..   7
    #                 0, 0/1  2
    #                    0    8 

    # option2: 0, 0/1 ..      3
    #             0, 0/1 ..   7
    #                 0, 0/1  2
    #                    1    5  

    # option3: 0, 0/1 ..      3
    #             0, 0/1 ..   7
    #                 1, 1/2  4
    #                    1    5               
    # option4: 0, 0/1 ..      3
    #             0, 0/1 ..   7
    #                 1, 1/2  4
    #                    2    9             
    # etc ....     
  # - the number of potential sums double with every array added to the collection   
# implicit rules:
#   - arrays ownt be empty
#   - arrays will always step up by 1 size
#   - arrays will contain integers    

#  ------------------ EXAMPLES / TEST CASES -----------------------
#  ------------------ DATA STRUCTURES -----------------------
#  ------------------ ALGORITHM / ABSTRACTION -----------------------
# given a collection which is an array of arrays, where the inner arrays contain only integers, inner arrays size starts at 1 element and increments by 1 size 

# challenge: construct some sort of looping or iterating function which
#  - starts at index 0 of first and second array, based on index of previous increment has options for the same index in subsequent element or index+1 but no others 
#  - i think to effectively solve this may require recursion, or a second method 

#  ------------------ CODE -----------------------

def longest_slide_down(pyramid)
  sums = []
  el_idx = 0
  counter = pyramid.size
  loop do
    secondary_idx = el_idx
    loop do
      pyr_idx = 0
      # result = 0
      result = []
      loop do
        if el_idx == secondary_idx
          if pyramid[pyr_idx].size > secondary_idx
            result << pyramid[pyr_idx][el_idx]
          else
            result << pyramid[pyr_idx][pyramid[pyr_idx].size - 1]
          end
        else
          if pyramid[pyr_idx].size - 1 > secondary_idx
            result << pyramid[pyr_idx][secondary_idx]
          else
            result << pyramid[pyr_idx][pyramid[pyr_idx].size - 2]
          end
        end
        pyr_idx += 1
        p "result is #{result}, pyr_idx is #{pyr_idx}, el_idx is #{el_idx} and sec_idx is #{secondary_idx}"
        break if pyr_idx == pyramid.size

      end
      sums << result.sum
      p sums
      secondary_idx += 1
      break if secondary_idx - 2 == el_idx
    end
    el_idx += 1
    break if el_idx == pyramid.size
    
  end
  sums.max
end

p longest_slide_down(
  [[3],
   [7, 4],
   [2, 4, 6],
   [8, 5, 9, 3]]) 
   # 23
# p longest_slide_down(
#   [[75],
#    [95, 64],
#    [17, 47, 82],
#    [18, 35, 87, 10],
#    [20,  4, 82, 47, 65],
#    [19,  1, 23, 75,  3, 34],
#    [88,  2, 77, 73,  7, 63, 67],
#    [99, 65,  4, 28,  6, 16, 70, 92],
#    [41, 41, 26, 56, 83, 40, 80, 70, 33],
#    [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
#    [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
#    [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
#    [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
#    [63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
#    [ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23]]),
#    1074,

# COME BACK TO LATER, AND REFACTOR WHEN DO TO AS TRIPLE NESTED LOOP IS TOO INEFFICENT