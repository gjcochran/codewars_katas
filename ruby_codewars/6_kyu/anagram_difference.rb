# https://www.codewars.com/kata/5b1b27c8f60e99a467000041/train/ruby

# Given two words, how many letters do you have to remove from them to make them anagrams?
#   Example
#   First word : C od E w AR s (4 letters removed)
#   Second word : ha C k ER r A nk (6 letters removed)
#   Result : 10

def anagram_difference(word1, word2)
  result = []
  arr = word2.chars
  word1.each_char do |char|
    if arr.include?(char)
      result << char
      arr.delete_at(arr.index(char))
      
    end
  end
  
  (word1.size + word2.size) - (result.size * 2)
end

p anagram_difference('', '')
p anagram_difference('a', '')
p anagram_difference('', 'a')
p anagram_difference('ab', 'a')
p anagram_difference('ab', 'ba')
p anagram_difference('ab', 'cd')
p anagram_difference('aab', 'a')
p anagram_difference('a', 'aab')
p (anagram_difference('codewars', 'hackerrank'))

# another solution from codewars below that is slightly more efficient

# def anagram_difference(w1, w2)
#   alpha = ('a'..'z').to_a
#   sum = 0
  
#   alpha.each do |char|
#     sum += (w1.count(char) - w2.count(char)).abs
#   end 
  
#   sum
# end