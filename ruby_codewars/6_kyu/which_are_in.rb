# https://www.codewars.com/kata/550554fd08b86f84fe000a58/train/ruby

# Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

# Example 1:
# a1 = ["arp", "live", "strong"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns ["arp", "live", "strong"]

# Example 2:
# a1 = ["tarp", "mice", "bull"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns []

# Notes:
# Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
# In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
# Beware: In some languages r must be without duplicates.

# note:  Lexicographical order is the order in which words appear in the dictonary

# P
# step 1 -- determine if a1 strings are part of ie substrings of any a2 strings
  # could nest a a2.each statement using include? method within a loop (loop iterating through a1)
# step 2 -- array#sort

def in_array(arr1, arr2)
  if arr1.empty? || arr2.empty?
    []
  else
    counter = 0
    result = []
    loop do
      arr2.each { |sub| sub.include?(arr1[counter]) ? result << arr1[counter] : next }
      counter += 1
      break if counter == arr1.size
    end
    result.uniq.sort
  end
end


a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
p in_array(a1, a2)

# codewars solution is quite simple using the select and any? methods!
# def in_array(array1, array2)
#   array1.select{|s| array2.any?{|w| w.include?(s) } }.sort
# end