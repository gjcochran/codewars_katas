# https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby

# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!

# The input is restricted to contain no numerals and only words containing the english alphabet letters.

# Example:

# alphabetized("The Holy Bible") # "BbeehHilloTy"

# irb(main):011:0> "The Holy Bible".split(' ').join.downcase.chars.sort
# => ["b", "b", "e", "e", "h", "h", "i", "l", "l", "o", "t", "y"]
# irb(main):013:0> "The Holy Bible".split(' ').join.chars.sort_by(&:downcase)
# => ["B", "b", "e", "e", "H", "h", "i", "l", "l", "o", "T", "y"]

def alphabetized(str)
  str.scan(/[a-zA-Z]/).join.chars.sort_by(&:downcase).join
end
# note that scan returned chars so didnt need the .join.chars before sort_by
# could have also written /[a-z]/i rather than /[a-zA-Z]/

p alphabetized("!@$%^&*()_+=-`,")
p alphabetized("The Holy Bible")
