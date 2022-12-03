# https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/ruby

# A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

# Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

def pangram?(str)
  alphabet = ('a'..'z').each_with_object({}) { |el, h| h[el] = 0 }
  str.downcase.chars.each { |char| alphabet[char] += 1 if alphabet.keys.include?(char) }
  alphabet.select { |k, _| alphabet[k].positive? }.size == 26
end

p pangram?("The quick brown fox jumps over the lazy dog")
p pangram?("This is not a pangram.")
p pangram?("ewMvtnbShyXkZpoJUacDfLiqgr")

# mine worked! but wow did i make it more complicated than needed to be. best practices codewars solution below...

def pangram_BP?(string)
  ('a'..'z').all? { |x| string.downcase.include? (x) } 
end

p pangram_BP?("The quick brown fox jumps over the lazy dog")
p pangram_BP?("This is not a pangram.")
p pangram_BP?("ewMvtnbShyXkZpoJUacDfLiqgr")