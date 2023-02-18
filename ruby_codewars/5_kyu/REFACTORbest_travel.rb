# https://www.codewars.com/kata/55e7280b40e1c4a06d0000aa/train/ruby

# John and Mary want to travel between a few towns A, B, C ... Mary has on a sheet of paper a list of distances between these towns. ls = [50, 55, 57, 58, 60]. John is tired of driving and he says to Mary that he doesn't want to drive more than t = 174 miles and he will visit only 3 towns.

# Which distances, hence which towns, they will choose so that the sum of the distances is the biggest possible to please Mary and John?

# Example:
# With list ls and 3 towns to visit they can make a choice between: [50,55,57],[50,55,58],[50,55,60],[50,57,58],[50,57,60],[50,58,60],[55,57,58],[55,57,60],[55,58,60],[57,58,60].

# The sums of distances are then: 162, 163, 165, 165, 167, 168, 170, 172, 173, 175.

# The biggest possible sum taking a limit of 174 into account is then 173 and the distances of the 3 corresponding towns is [55, 58, 60].

# The function chooseBestSum (or choose_best_sum or ... depending on the language) will take as parameters t (maximum sum of distances, integer >= 0), k (number of towns to visit, k >= 1) and ls (list of distances, all distances are positive or zero integers and this list has at least one element). The function returns the "best" sum ie the biggest possible sum of k distances less than or equal to the given limit t, if that sum exists, or otherwise nil, null, None, Nothing, depending on the language. In that case with C, C++, D, Dart, Fortran, F#, Go, Julia, Kotlin, Nim, OCaml, Pascal, Perl, PowerShell, Reason, Rust, Scala, Shell, Swift return -1.
# Examples:
# ts = [50, 55, 56, 57, 58] choose_best_sum(163, 3, ts) -> 163

# xs = [50] choose_best_sum(163, 3, xs) -> nil (or null or ... or -1 (C++, C, D, Rust, Swift, Go, ...)

# ys = [91, 74, 73, 85, 73, 81, 87] choose_best_sum(230, 3, ys) -> 228

# THIS METHOD WORKS WELL ON ALL TESTS THAT HAVE TRIED, BUT EXECUTION TIMES OUT ON CODEWARS LONGER TESTS SO NEED TO REFACTOR
def choose_best_sum(max_total_distance, num_towns_to_visit, distance_list)
  return nil if distance_list.size < num_towns_to_visit
  return distance_list.max if num_towns_to_visit == 1

  a = distance_list
  options = a
  p options
  counter = 1
  loop do
    break if counter == num_towns_to_visit

    counter += 1
    options = options.product(a)
  end

  options = options.map(&:flatten).map(&:sort).uniq.map(&:uniq).select { |el| el.size == num_towns_to_visit}

  selection = options.map{ |el| [el.sum, el] }.select { |el| el[0] <= max_total_distance }
  
  selection.empty? ? nil : selection.max.first
end

p '----------------'
list_1 = [50, 55, 56, 57, 58]
p choose_best_sum(163, 3, list_1) # 163)
# p '----------------'
list_2 = [50]
p choose_best_sum(163, 3, list_2) # nil)
# p '----------------'
list_3 = [91, 74, 73, 85, 73, 81, 87]
p choose_best_sum(230, 3, list_3) # 228)


p '----------------'
# goal: [50,55,57],[50,55,58],[50,55,60],[50,57,58],[50,57,60],[50,58,60],[55,57,58],[55,57,60],[55,58,60],[57,58,60]
# a = [50, 55, 57, 58, 60]
# b = a
# c = a
# d = a.product(b, c).map(&:sort).uniq.map(&:uniq).select { |el| el.size == 3}
# p d #=> [[50, 55, 57], [50, 55, 58], [50, 55, 60], [50, 57, 58], [50, 57, 60], [50, 58, 60], [55, 57, 58], [55, 57, 60], [55, 58, 60], [57, 58, 60]]

