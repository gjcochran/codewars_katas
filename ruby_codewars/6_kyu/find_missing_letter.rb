# https://www.codewars.com/kata/5839edaa6754d6fec10000a2/train/ruby

# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

# You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
# The array will always contain letters in only one case.

# Example:

# ['a','b','c','d','f'] -> 'e'
# ['O','Q','R','S'] -> 'P'

# D/A
# create second array of all letters
# input.downcase
# arr.index(input[0])
# arr[^..^+input.size+1]
# select if doesnt include

def find_missing_letter(input)
  alph = ('a'..'z').to_a
  arr = input.map(&:downcase)
  st = alph.index(arr[0])
  comp = alph[st..st+(arr.size)]
  result = comp.reject { |el| arr.include?(el) }.join
  input.include?(arr[0]) ? result : result.upcase
end

p find_missing_letter(["a","b","c","d","f"]) #=> "e")
p find_missing_letter(["O","Q","R","S"]) #=> "P")
p find_missing_letter(["b","d"]) #=> "c")
p find_missing_letter(["a","b","d"]) #=> "c")
p find_missing_letter(["b","d","e"]) #=> "c")

# codewars solution is brilliant. pasted below for reference...
# def find_missing_letter(arr)
#   ((arr.first..arr.last).to_a - arr).first
# end