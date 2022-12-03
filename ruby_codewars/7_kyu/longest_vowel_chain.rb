# https://www.codewars.com/kata/59c5f4e9d751df43cf000035/train/ruby
# The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

# D/A
# separate a string using regex by the consonants and save as array
# then can iterate over this array and count the substrings and return the longest using max method

  # irb(main):004:0> string
  # => "codewarriors"
  # irb(main):005:0> string.split(/[^aeiou]/)
  # => ["", "o", "e", "a", "", "io"]


def solve(s)
  s.split(/[^aeiou]/).map { |sub| sub.size }.max
end

p solve("codewarriors")
p solve("ultrarevolutionariees")

# my solution works well and is similar to many others. a slightly simpler solution from codewars pasted below for reference
# def solve(s)
#   s.scan(/[aeiou]+/).map(&:size).max
# end

    # irb(main):009:0> string
    # => "codewarriors"
    # irb(main):010:0> string.split(/[^aeiou]/)
    # => ["", "o", "e", "a", "", "io"]
    # irb(main):011:0> string.scan(/[aeiou]+/)
    # => ["o", "e", "a", "io"]