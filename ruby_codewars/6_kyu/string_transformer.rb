# https://www.codewars.com/kata/5878520d52628a092f0002d0/train/ruby

# Given a string, return a new string that has transformed based on the input:

# Change case of every character, ie. lower case to upper case, upper case to lower case.
# Reverse the order of words from the input.
# Note: You will have to handle multiple spaces, and leading/trailing spaces.

# For example:

# "Example Input" ==> "iNPUT eXAMPLE"
# You may assume the input only contain English alphabet and spaces.

def string_transformer(str)
  # str.split(/ /).reverse.join(' ').swapcase
  str.gsub(/\w+/) { |s| s.reverse }.swapcase.reverse
end

p string_transformer('Example string') #=> 'STRING eXAMPLE'

# other options from codewars...

# def string_transformer(str)
#   str.split(/\b/).reverse.map(&:swapcase).join
# end

# def string_transformer(str)
#   str.swapcase.split(/\b/).reverse.join
# end