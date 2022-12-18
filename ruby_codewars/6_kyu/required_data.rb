# https://www.codewars.com/kata/55f95dbb350b7b1239000030/train/ruby
# We need a function count_sel() that receives an array or list of integers (positive and negative) and may give us the following information in the order and structure presented bellow:

# [(1), (2), (3), [[(4)], 5]]

# (1) - Total amount of received integers.

# (2) - Total amount of different values the array has.

# (3) - Total amount of values that occur only once.

# (4) and (5) both in a list

# (4) - It is (or they are) the element(s) that has (or have) the maximum occurrence. If there are more than one, the elements should be sorted (by their value obviously)

# (5) - Maximum occurrence of the integer(s)

# Let's see some cases

# ____ count_sel([-3, -2, -1, 3, 4, -5, -5, 5, -1, -5]) ----> [10, 7, 5, [[-5], 3]]

# (1) - The list has ten elements (10 numbers)

# (2) - We have seven different values: -5, -3, -2, -1, 3, 4, 5 (7 values)

# (3) - The numbers that occur only once: -3, -2, 3, 4, 5 (5 values)

# (4) and (5) - The number -5 occurs three times (3 occurrences)

# ____ count_sel([4, 4, 2, -3, 1, 4, 3, 2, 0, -5, 2, -2, -2, -5]) ----> [14, 8, 4, [[2, 4], 3]]

# D/A
# Total amount of received integers. # arr.size
# Total amount of different values the array has. # arr.uniq.size
# Total amount of values that occur only once. # select arr.count(el) == 1 .size
# the element(s) that has (or have) the maximum occurrence. # select arr.count(el) > 1 .sort + the count


def count_sel(arr)
  result = []
  result << arr.size
  result << arr.uniq.size
  result << arr.select { |el| arr.count(el) == 1 }.size
  max = arr.each_with_object ({}) { |el, h| h[el] = arr.count(el) }
  max = max.select { |k, v| v == max.values.max }
  result << [max.keys.sort, max.values.uniq.join.to_i]
  result
end

p count_sel([-3, -2, -1, 3, 4, -5, -5, 5, -1, -5]) # [10, 7, 5, [[-5], 3]])
p count_sel([5, -1, 1, -1, -2, 5, 0, -2, -5, 3]) # [10, 7, 4, [[-2, -1, 5], 2]])
p count_sel([-2, 4, 4, -2, -2, -1, 3, 5, -5, 5]) # [10, 6, 3, [[-2], 3]])
p count_sel([4, -5, 1, -5, 2, 4, -1, 4, -1, 1]) # [10, 5, 1, [[4], 3]])
p count_sel([4, 4, 2, -3, 1, 4, 3, 2, 0, -5, 2, -2, -2, -5]) # [14, 8, 4, [[2, 4], 3]])

# codewars answer
# def count_sel lst
#   u = lst.uniq.sort
#   g = u.group_by{|l|lst.count l}
#   [lst.size, u.size, (g[1]or[]).size, g.max.reverse]
# end