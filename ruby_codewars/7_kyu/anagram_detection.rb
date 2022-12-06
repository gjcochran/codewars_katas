# https://www.codewars.com/kata/529eef7a9194e0cbc1000255

# An anagram is the result of rearranging the letters of a word to produce a new word 

# Note: anagrams are case insensitive

# Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.

# Examples
# "foefet" is an anagram of "toffee"

# "Buckethead" is an anagram of "DeathCubeK"

def is_anagram(test, original)
  arr1 = test.downcase.chars
  arr2 = original.downcase.chars

  result = ''
  arr1.each do |el|
    if arr2.include?(el)
      result += el
      arr2.delete_at(arr2.index(el))
    end
  end
  result.size == test.size && result.size == original.size
end


p is_anagram('Creative', 'Reactive') #=> true, 'The word Creative is an anagram of Reactive')
p is_anagram("foefet", "toffee") #=> true, 'The word foefet is an anagram of toffee')
p is_anagram("Buckethead", "DeathCubeK") #=> true, 'The word Buckethead is an anagram of DeathCubeK')
p is_anagram("Twoo", "WooT") #=> true, 'The word Twoo is an anagram of WooT')
p is_anagram("dumble", "bumble") #=> false, 'Characters do not match for test case dumble, bumble')
p is_anagram("ound", "round") #=> false, 'Missing characters for test case ound, round')
p is_anagram("apple", "pale") #=> false, 'Same letters, but different count')

# codewars solution much more elegant, pasted below for reference

# def is_anagram(test, original)
#   test.downcase.chars.sort == original.downcase.chars.sort
# end
