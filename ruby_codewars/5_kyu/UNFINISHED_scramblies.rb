# https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby

# Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

# Notes:

# Only lower case letters will be used (a-z). No punctuation or digits will be included.
# Performance needs to be considered.
# Examples
# scramble('rkqodlw', 'world') ==> True
# scramble('cedewaraaossoqqyt', 'codewars') ==> True
# scramble('katas', 'steak') ==> False

# .chars for both strings
# each for str2 over str1 array, if includes then move on 

def scramble(s1, s2)
  result = []
  s2.each_char do |el| 
    if s1.include?(el)
      s1.delete(el)
      result << el
    end
  end
  result.size == s2.size
end

p scramble('rkqodlw', 'world')
p scramble('cedewaraaossoqqyt', 'codewars')
p scramble('katas', 'steak')

# apparently this code takes too long for codewars servers... hard to believe as is so simple

def scramble_v2(s1, s2)
  s2.chars.select { |el| s1.include?(el) ? (el; s1.delete(el)) : next }.size == s2.size
end

p scramble_v2('rkqodlw', 'world')
p scramble_v2('cedewaraaossoqqyt', 'codewars')
p scramble_v2('katas', 'steak')

# super frustrating, they still say takes too long to run

def scramble_v3(s1, s2)
  s2.chars.select { |el| s1[el].nil? ? next : (el; s1.delete(el))}.size == s2.size
end

p scramble_v3('rkqodlw', 'world')
p scramble_v3('cedewaraaossoqqyt', 'codewars')
p scramble_v3('katas', 'steak')

# match method takes even longer than include...
# s1[el].nil? still takes too long


