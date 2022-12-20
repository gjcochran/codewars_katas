# https://www.codewars.com/kata/55466989aeecab5aac00003e/train/ruby

# The drawing below gives an idea of how to cut a given "true" rectangle into squares ("true" rectangle meaning that the two dimensions are different).

# basically... divides a rectange with width 5 and height 3 into 4 squares ... one 3x3, one 2x2, and two 1x1 ... ie still same 15 squares 

# Can you translate this drawing into an algorithm?

# You will be given two dimensions

# a positive integer length
# a positive integer width
# You will return a collection or a string (depending on the language; Shell bash, PowerShell, Pascal and Fortran return a string) with the size of each of the squares.

# Examples in general form:
# (depending on the language)

#   sqInRect(5, 3) should return [3, 2, 1, 1]
#   sqInRect(3, 5) should return [3, 2, 1, 1]
  
#   You can see examples for your language in **"SAMPLE TESTS".**
# Notes:
# lng == wdth as a starting case would be an entirely different problem and the drawing is planned to be interpreted with lng != wdth. (See kata, Square into Squares. Protect trees! http://www.codewars.com/kata/54eb33e5bc1a25440d000891 for this problem).

# When the initial parameters are so that lng == wdth, the solution [lng] would be the most obvious but not in the spirit of this kata so, in that case, return None/nil/null/Nothing

def sqInRect(lng, wdth)
  return nil if lng == wdth 
  area = [lng, wdth]
  largest_sqrt = area.min
  available_sum = area.inject(:*)
  result = []
  loop do
    sqd = largest_sqrt ** 2
    result << largest_sqrt
    available_sum -= sqd
    area = area.map { |el| el > largest_sqrt ? el - largest_sqrt : el }
    largest_sqrt = area.min
    break if available_sum == 0
  end
  result
end

p sqInRect(5, 3)
p sqInRect(14, 20)

# recursive codewars solution pasted for reference
# def sqInRect(lng, wdth)
#   min, max = [lng, wdth].minmax
#   min == max ? nil : [min] + (sqInRect(max - min, min) || [min])
# end