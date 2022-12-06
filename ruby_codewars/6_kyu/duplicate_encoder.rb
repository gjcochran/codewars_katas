# https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/ruby

# The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

# Examples
# "din"      =>  "((("
# "recede"   =>  "()()()"
# "Success"  =>  ")())())"
# "(( @"     =>  "))((" 

def duplicate_encode(str)
  
  result = []
  counter = 0
  loop do
    arr = str.downcase.chars
    el = arr[counter]
    
    arr.delete_at(arr.index(el))
   
    result << arr.include?(el)
    counter += 1
    break if counter == str.size
  end
  result.map { |el| el == false ? '(' : ')' }.join
end

p duplicate_encode("din") #=> "((("
p duplicate_encode("recede") #=> "()()()"
p duplicate_encode("Success") #=> ")())())","should ignore case"
p duplicate_encode("(( @") #=> "))(("

# looking at codewars solutions, the count method would have been simpler!! example pasted below for reference

# def duplicate_encode(word)
#   word
#       .downcase
#       .chars
#       .map { |char| word.downcase.count(char) > 1 ? letter = ')' : letter = '(' }
#       .join
# end