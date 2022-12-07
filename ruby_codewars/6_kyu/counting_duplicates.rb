# https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/ruby

# Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

#   Example
#   "abcde" -> 0 # no characters repeats more than once
#   "aabbcde" -> 2 # 'a' and 'b'
#   "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
#   "indivisibility" -> 1 # 'i' occurs six times
#   "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
#   "aA11" -> 2 # 'a' and '1'
#   "ABBA" -> 2 # 'A' and 'B' each occur twice

# D/A
# will make a hash using each with object
# input.downcase.each_char and add count to the key/value
# hash.delete if value is zero
# hash.size

def duplicate_count(str)
  arr = str.downcase.chars
  hsh = arr.each_with_object ({}) { |el, h| h[el] = arr.count(el) }
  hsh.delete_if { |k, v| v < 2 }.size
end


p duplicate_count("") #=> 0)
p duplicate_count("abcde") #=> 0)
p duplicate_count("abcdeaa") #=> 1)
p duplicate_count("abcdeaB") #=> 2)
p duplicate_count("Indivisibilities") #=> 2)

# codewars answer below
# def duplicate_count(text)
#   ('a'..'z').count { |c| text.downcase.count(c) > 1 }
# end