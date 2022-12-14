# https://www.codewars.com/kata/52774a314c2333f0a7000688

# Write a function that takes a string of parentheses, and determines if the order of the parentheses is valid. The function should return true if the string is valid, and false if it's invalid.

# Examples
# "()"              =>  true
# ")(()))"          =>  false
# "("               =>  false
# "(())((()())())"  =>  true

def valid_parentheses(str)
  arr = str.chars
  open_counter = 0
  close_counter = 0

  arr.each do |el|
    return false if close_counter > open_counter
    open_counter += 1 if el == '('
    close_counter += 1 if el == ')'
  end
  open_counter == close_counter
end

p valid_parentheses("  (") #false)
p valid_parentheses(")test") #false)
p valid_parentheses("") #true)
p valid_parentheses("hi())(") #false)
p valid_parentheses("hi(hi)()") #true)