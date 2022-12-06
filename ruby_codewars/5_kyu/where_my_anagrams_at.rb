# https://www.codewars.com/kata/523a86aa4230ebb5420001e1/train/ruby

# Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

# anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']

# anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']

# anagrams('laser', ['lazing', 'lazy',  'lacer']) => []

def anagrams(word, words)
  result = []
  words.map { |el| el.chars }.each do |sub|
    sub_res = []
    arr = word.chars
    counter = 0
    loop do
      if arr.include?(sub[counter])
        sub_res << sub[counter]
        arr.delete_at(arr.index(sub[counter]))
      end
      counter += 1
      break if counter == sub.size
    end
    result << sub_res
  end
  # p result
  a = result.map(&:join)
  
  final = []
  a.each_index { |idx| a[idx] == words[idx] ? final << words[idx] : next }
  
  final
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) #=> ['aabb', 'bbaa']

p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) # => ['carer', 'racer']


p anagrams('laser', ['lazing', 'lazy',  'lacer']) #=> []

# solution works and passed all tests although could not submit kata solution bc kata is retired.