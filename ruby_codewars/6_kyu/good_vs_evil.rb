# input: 2 strings of integers
#   each with 6 ints separated by spaces
#   ints represent the count/quantity of races fighting for each LOTR army...
#   good, in order: hobbits, men, elves, dwarves, eagles, wizards
#   evil, in order: orcs, men, wargs, goblins, uruk hai, trolls, wizards
#   each race has a specific worth, given
# output: if good > evil, good string ....etc

def good_vs_evil(good, evil)
  g = [1, 2, 3, 3, 4, 10]
  e = [1, 2, 2, 2, 3, 5, 10]
  good_score = good.split.map(&:to_i).map.with_index { |n, idx| n * g[idx] }.sum
  evil_score = evil.split.map(&:to_i).map.with_index { |n, idx| n * e[idx] }.sum
  if good_score > evil_score
    'Battle Result: Good triumphs over Evil'
  elsif good_score < evil_score
    'Battle Result: Evil eradicates all trace of Good'
  else
    'Battle Result: No victor on this battle field'
  end
end

p good_vs_evil('1 0 0 0 0 0', '1 0 0 0 0 0 0')
p good_vs_evil('0 0 0 0 0 10', '0 1 1 1 1 0 0')
