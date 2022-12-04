# https://www.codewars.com/kata/543e8390386034b63b001f31

# Write a method that takes a string as an argument and groups the number of time each character appears in the string as a hash sorted by the highest number of occurrences.

# The characters should be sorted alphabetically e.g:

# get_char_count("cba") => {1=>["a", "b", "c"]}
# You should ignore spaces, special characters and count uppercase letters as lowercase ones.

# For example:

# get_char_count("Mississippi") => {4=>["i", "s"], 2=>["p"], 1=>["m"]}
# get_char_count("Hello. Hello? HELLO!!") => {6=>["l"], 3=>["e", "h", "o"]}
# get_char_count("aaa...bb...c!") => {3=>["a"], 2=>["b"], 1=>["c"]}
# get_char_count("aaabbbccc") => {3=>["a", "b", "c"]}
# get_char_count("abc123") => {1=>["1", "2", "3", "a", "b", "c"]}

# D/A
# will create a hash first with they keys as individual letters and the value incremented based on char.count
# then will iterate through the hash and for each number create a corresponding array that letters are added to
# then can convert this array of arrays to a hash

# tests before write code:

# a = {'a': 2, 'b': 1, 'c': 2}

# counter = 1
# hash = {}
# loop do
#   index = 0
#   loop do
#     if a.values[index] == counter && hash[counter].nil?
#       hash[counter] = []
#       hash[counter] << a.keys[index]
#       index += 1
#     elsif a.values[index] == counter
#       hash[counter] << a.keys[index]
#       index += 1
#     else
#       index += 1
#     end
#     break if index == a.size
#   end
#   counter += 1
#   index = 0
#   break if counter > a.values.max
# end
# p hash

# C
def get_char_count(str)
  arr = str.downcase.scan(/\w/)
  a = arr.each_with_object({}) { |el, h| h[el] = arr.count(el) }
  
  counter = a.values.max
  hash = {}
  loop do
    index = 0
    loop do
      if a.values[index] == counter && hash[counter].nil?
        hash[counter] = []
        hash[counter] << a.keys[index]
        index += 1
      elsif a.values[index] == counter
        hash[counter] << a.keys[index]
        index += 1
      else
        index += 1
      end
      break if index == a.size
    end
    counter -= 1
    index = 0
    break if counter == 0
  end
  hash.map { |k, v| [k, v.sort] }.to_h
end

p get_char_count("Mississippi")
p get_char_count("Hello. Hello? HELLO!!")
p get_char_count("aaa...bb...c!")
p get_char_count("aaabbbccc")
p get_char_count("abc123")

# THIS CODE ABOVE WORKS BUT CANNOT SUBMIT TO CODEWARS BECAUSE IS INEFFICIENT... WILL REFACTOR AND RESUBMIT