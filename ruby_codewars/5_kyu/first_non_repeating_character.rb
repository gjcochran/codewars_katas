# https://www.codewars.com/kata/52bc74d4ac05d0945d00054e/train/ruby

# Write a function named first_non_repeating_letter that takes a string input, and returns the first character that is not repeated anywhere in the string.

# For example, if given the input 'stress', the function should return 't', since the letter t only occurs once in the string, and occurs first in the string.

# As an added challenge, upper- and lowercase letters are considered the same character, but the function should return the correct case for the initial letter. For example, the input 'sTreSS' should return 'T'.

# If a string contains all repeating characters, it should return an empty string ("") or None -- see sample tests.

def first_non_repeating_letter(s)
  arr = s.chars.map(&:downcase)
  result = arr.select { |e| arr.count(e) == 1 }
  result = result.map { |el| s.include?(el) ? el : el.upcase}
  result.empty? ? "" : result.first
end

# p first_non_repeating_letter('a') # 'a')
# p first_non_repeating_letter('stress') # 't')
# p first_non_repeating_letter('moonmen') # 'e')
# p first_non_repeating_letter('') # '')
# p first_non_repeating_letter('sTreSS')

# codewars example used the find method...
def  first_non_repeating_letter_2(s) 
	s.chars.find {|i| s.downcase.count(i)==1 || s.upcase.count(i)==1} || ""
end

p first_non_repeating_letter_2('a') # 'a')
p first_non_repeating_letter_2('stress') # 't')
p first_non_repeating_letter_2('moonmen') # 'e')
p first_non_repeating_letter_2('') # '')
p first_non_repeating_letter_2('sTreSS')