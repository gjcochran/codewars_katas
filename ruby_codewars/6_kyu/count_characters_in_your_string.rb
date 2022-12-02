# https://www.codewars.com/kata/52efefcbcdf57161d4000091/train/ruby

# problem:
# The main idea is to count all the occurring characters in a string. If you have a string like aba, then the result should be {'a': 2, 'b': 1}.

# What if the string is empty? Then the result should be empty object literal, {}.

def count_chars(s)
  result = {}
  default = 1
  s.each_char do |char|
    result.keys.include?(char) ? result[char] += 1 : result[char] = default
    end
  result
end

p count_chars('aba')
p count_chars('')
p count_chars('abcdefabcdeabcab')

# mine worked well, to note there are simpler options. one simpler option from codewars below for reference...
# def count_chars(s)
#   s.chars.uniq.each_with_object({}) { |c, h| h[c] = s.count(c) }
# end