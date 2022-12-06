# https://www.codewars.com/kata/57eb8fcdf670e99d9b000272

# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.

# D/A
# going to make a hash 1..26 as keys and 'a'..'z' as values

def high(sentence)
  arr = ("a".."z").to_a
  hsh = (1..26).each_with_object ({}) { |el, h| h[el] = arr[el-1] }
  result = sentence.split.map { |word| word.chars.map { |ch| hsh.key(ch) } }.map { |sub| sub.inject(:+) }
  idx = result.index(result.max)
  sentence.split[idx]
end

# TESTCASES
p high('man i need a taxi up to ubud') #=> 'taxi')
p high('what time are we climbing up the volcano') #=> 'volcano')
p high('take me to semynak') #=> 'semynak')
p high('aa b') #=> 'aa')
p high('b aa') #=> 'b')
p high('bb d') #=> 'bb')
p high('d bb') #=> 'd') 
p high('aaa b') #=> 'aaa')
  
# codewars solution below, for reference. 

# def high(x)
#   x.split.max_by { |w| score_word(w) }
# end

# def score_word(word)
#   word.chars.inject(0) { |sum, ch| sum + (ch.ord - 96) }
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