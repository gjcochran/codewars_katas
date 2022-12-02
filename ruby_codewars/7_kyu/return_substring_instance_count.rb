# https://www.codewars.com/kata/5168b125faced29f66000005/train/ruby

# PROBLEM:
# Complete the solution so that it returns the number of times the search_text is found within the full_text.

# EXAMPLE:
# solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
# solution('aaabbbcccc', 'bbb') # should return 1

# D/A

  # irb(main):003:0> str = 'aa_bb_cc_dd_bb_e'.gsub('bb', '*')
  # => "aa_*_cc_dd_*_e"

  # irb(main):005:0> arr = str.chars
  # => ["a", "a", "_", "*", "_", "c", "c", "_", "d", "d", "_", "*", "_", "e"]

  # irb(main):007:0> b = arr.select { |el| el == '*' }
  # => ["*", "*"]

  # irb(main):008:0> b.size
  # => 2

  # going to use these same methods as in irb but combine into one line so that dont have to create multiple local variables

def solution(full_text, search_text)
  full_text.gsub(search_text, '*').chars.select { |el| el == '*'}.size
end

# after posting in codewars, note that scan method would have been simpler than my pieced together gsub+chars+select ...
# def solution(full_text, search_text)
#   full_text.scan(search_text).size
# end

