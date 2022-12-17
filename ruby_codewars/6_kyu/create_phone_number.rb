# https://www.codewars.com/kata/525f50e3b73515a6db000b83

# Write a function that accepts an array of 10 integers (between 0 and 9), that returns a string of those numbers in the form of a phone number.

# Example
# createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) # => returns "(123) 456-7890"

def create_phone_number(arr)
  str = ''
  arr.each { |el| str << el.to_s }
  str.prepend('(')
  str[3] += ') '
  str[8] += '-'
  str
end

p create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) # "(123) 456-7890"
p create_phone_number([1, 1, 1, 1, 1, 1, 1, 1, 1, 1]) # "(111) 111-1111"
p create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) # "(123) 456-7890"

# codewars answer using regex...
def createPhoneNumber(array)
  '(%d%d%d) %d%d%d-%d%d%d%d' % array
end
p createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) # "(123) 456-7890"