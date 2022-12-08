# https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991

# The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).

# If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.

# If

# sz is <= 0 or if str is empty return ""
# sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
# Examples:
# revrot("123456987654", 6) --> "234561876549"
# revrot("123456987653", 6) --> "234561356789"
# revrot("66443875", 4) --> "44668753"
# revrot("66443875", 8) --> "64438756"
# revrot("664438769", 8) --> "67834466"
# revrot("123456779", 8) --> "23456771"
# revrot("", 8) --> ""
# revrot("123456779", 0) --> "" 
# revrot("563000655734469485", 4) --> "0365065073456944"
# Example of a string rotated to the left by one position:
# s = "123456" gives "234561".

  # irb(main):010:0> str
  # => "987654"
  # irb(main):011:0> str.scan(/../)
  # => ["98", "76", "54"]

  # irb(main):006:0> str[1..-1]+str[0]
  # => "876549"
  # irb(main):007:0> str.reverse
  # => "456789"

  # main question... how do i multiple the regex dot??
    # answer... irb(main):038:0> str.scan(/#{dots}/)
# => ["98", "76", "54"]

def revrot(str, sz)
  dots = '.' * sz
  arr = str.scan(/#{dots}/)
  result = arr.map do |el| 
    if el.chars.map { |el| el.to_i ** 3 }.sum.even?
      el.reverse 
    else
      el[1..-1]+el[0]
    end
  end
  result.join
end

# refactored
def revrot(str, sz)
  arr = str.scan(/#{'.' * sz}/)
  arr.map { |el| el.chars.map { |n| n.to_i ** 3 }.sum.even? ? el.reverse : el[1..-1]+el[0] }.join
end


p revrot("123456987654", 6) #--> "234561876549"
p revrot("123456987653", 6) #--> "234561356789"
p revrot("66443875", 4) #--> "44668753"
p revrot("66443875", 8) #--> "64438756"
p revrot("664438769", 8) #--> "67834466"
p revrot("123456779", 8) #--> "23456771"
p revrot("", 8) #--> ""
p revrot("123456779", 0) #--> "" 
p revrot("563000655734469485", 4) #--> "0365065073456944"

# note from reviewing other codewars solutions that could have used str.scan(/.{#{sz}}/) rather than str.scan(/#{'.' * sz}/)

  # irb(main):048:0> str.scan(/#{'.'*2}/)
  # => ["98", "76", "54"]

  # irb(main):050:0> str.scan(/.{#{2}}/)
  # => ["98", "76", "54"]

  # irb(main):051:0> str.scan(/.{2}/)
  # => ["98", "76", "54"]