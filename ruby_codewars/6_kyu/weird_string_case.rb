# https://www.codewars.com/kata/52b757663a95b11b3d00062d/train/ruby

# Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased and you need to start over for each word.

# The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').

# Examples:
# weirdcase( "String" )#=> returns "StRiNg"
# weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"

def weirdcase(str)
  str.split.map { |sub| sub.chars.map.with_index { |el, idx| idx.even? ? el.upcase : el.downcase }.join }.join(' ')
end

p weirdcase( "String" )#=> returns "StRiNg"
p weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"

# codewars example below using gsub, for reference
# def weirdcase string
#   string.gsub(/(\w{1,2})/) { |s| $1.capitalize }
# end