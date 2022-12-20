# https://www.codewars.com/kata/5277c8a221e209d3f6000b56/train/ruby

# Write a function that takes a string of braces, and determines if the order of the braces is valid. It should return true if the string is valid, and false if it's invalid.

# This Kata is similar to the Valid Parentheses Kata, but introduces new characters: brackets [], and curly braces {}. Thanks to @arnedag for the idea!

# All input strings will be nonempty, and will only consist of parentheses, brackets and curly braces: ()[]{}.

# What is considered Valid?
# A string of braces is considered valid if all braces are matched with the correct brace.

# Examples
# "(){}[]"   =>  True
# "([{}])"   =>  True
# "(}"       =>  False
# "[(])"     =>  False
# "[({})](]" =>  False

# set each type of brace variable to 0
# cant ever go negative
# + 1 for ( -1 for )

def validBraces(braces)
  # type1 = 0
  # type2 = 0
  # type3 = 0
  # arr = braces.chars
  # arr.each do |el|
  #   if type1 < 0 || type2 < 0 || type3 < 0
  #     false
  #     break
  #   elsif el == '('
  #     type1 += 1
  #   elsif el == ')'
  #     type1 -= 1
  #   elsif el == '['
  #     type1 += 2
  #   elsif el == ']'
  #     type1 -= 2
  #   elsif el == '{'
  #     type1 += 3
  #   elsif el == '}'
  #     type1 -= 3
  #   end
  # end
  # false if type1 != 0 || type2 != 0 || type3 != 0 
  arr = braces.chars
  hsh = { a: 0, b: 0, c: 0 }
  arr.each do |el|
    if el == '(' || el == ')'
      hsh[:a] += 1
    elsif el == '[' || el == ']'
      hsh[:b] += 1
    else
      hsh[:c] += 1
    end
  end
  hsh
end


p validBraces( "()" ) # true)
p validBraces( "[(])" ) # false)
# ^^ this second condition is the tricky one... come back to later