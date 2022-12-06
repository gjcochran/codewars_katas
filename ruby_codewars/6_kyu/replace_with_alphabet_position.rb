# https://www.codewars.com/kata/546f922b54af40e1e90001da

# In this kata you are required to, given a string, replace every letter with its position in the alphabet.

# If anything in the text isn't a letter, ignore it and don't return it.

# "a" = 1, "b" = 2, etc.

# Example
# alphabet_position("The sunset sets at twelve o' clock.")
# Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" ( as a string )

def alphabet_position(text)
  al = ('a'..'z').to_a
  hsh = (1..26).each_with_object ({}) { |el, h| h[el] = al[el-1] }

  arr = text.downcase.chars.select { |el| al.include?(el) }
  arr.map { |el| hsh.key(el) }.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.")

# codewars solution below

# def alphabet_position(text)
#   text.gsub(/[^a-z]/i, '').chars.map{ |c| c.downcase.ord - 96 }.join(' ')
# end

# note...
# The number 96 here is used to make character values, starting with "a", to be equal to an Integer.

# For example:

# If you do "a".ord you get 97.

# Then substract 96 from that, you get 1.

# With "b".ord you get 98.

# Minus 96 you get 2.

# Etc.

# This way every character is worth it's position in the alphabet as an integer value.

# If you want to know where these numbers come from, read about character encoding, more specifically about the ASCII & UTF-8 encoding formats.