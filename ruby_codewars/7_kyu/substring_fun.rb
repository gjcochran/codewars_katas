# https://www.codewars.com/kata/565b112d09c1adfdd500019c/train/ruby

# PROBLEM:
# Complete the function that takes an array of words.

# You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

# For example:
# ["yoda", "best", "has"]  -->  "yes"
#   ^        ^        ^
#   n=0     n=1     n=2

def nth_char(words)
  return '' if words.empty?
  counter = 0
  result = ""
  loop do
    result += words[counter][counter]
    counter += 1
    break if counter == words.size
  end
  result
end

p nth_char(["yoda", "best", "has"])
p nth_char([])
p nth_char(['X-ray'])
p nth_char(['No','No'])
p nth_char(['Chad','Morocco','India','Algeria','Botswana','Bahamas','Ecuador','Micronesia'])

# codewars best practices answers copied below for reference...
# def nth_char(words)
#   words.map.with_index{|x,i| x[i]}.join
# end

# def nth_char(words)
#   words.each_with_index.inject("") { |new_word, (word, index)|
#     new_word << word[index]
#   }    
# end

# def nth_char(words)
#   result = ''
#   words.each_with_index do |word, index|
#     result << word[index]
#   end
#   result
# end