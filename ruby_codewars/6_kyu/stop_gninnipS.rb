# https://www.codewars.com/kata/5264d2b162488dc400000001

# Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

# Examples:

# spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw" 
# spinWords( "This is a test") => returns "This is a test" 
# spinWords( "This is another test" )=> returns "This is rehtona test"

def spinWords(str)
  str.split.map { |el| el.size >= 5 ? el.reverse : el }.join(' ')
end

p spinWords( "Hey fellow warriors" ) 
p spinWords( "This is a test") 
p spinWords( "This is another test" )

# mine worked well. another option given be codewars below for reference

def spinWords_CW(string)
  string.gsub(/\w{5,}/, &:reverse)
end

p spinWords_CW( "Hey fellow warriors" ) 
p spinWords_CW( "This is a test") 
p spinWords_CW( "This is another test" )