# https://www.codewars.com/kata/59da47fa27ee00a8b90000b4/train/ruby
# Given a string of integers, return the number of odd-numbered substrings that can be formed.

# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

# solve("1341") = 7 

# P
# 1341
# 1 3 4 1 13 34 41 134 341 1341 == 10 total options and 7 are odd 
# D/A
# 




# realized that was making this way too complicated... dont have to alter the string at all for all combinations lol. work below, will redo actual problem above

# length 4 mental model

 # [0], [0][1], [0][2], [0][3], [0][1][2], [0][1][3], [0][2][1], [0][2][3], [0][3][1], [0][3][2], [0][1][2][3], [0][1][3][2], [0][1][3][2], [0][2][1][3], [0][2][3][1], [0][3][1][2], [0][3][2][1]
#  then same thing with 1 as first item

# ruby has a method that does this, Array#product
# https://ruby-doc.org/core-3.1.2/Array.html#method-i-product

# attempt 1 using produt, didnt work
# def solve(string)
#   arr = string.chars.map { |e| [e] }
#   arr.first.product(*arr[1..-1])
# end

# p solve("1341")

# atttempt 2 modifying some code that read on medium
# https://medium.com/@domarp/determining-all-possible-permutations-of-a-string-5314a2844c4

# def perms(str)
#   all_perms = []
  
#   loop do
#     counter = str.size
#     if counter > 2
#       str.split('').each_with_index do |char, ind|
#         sub_str = str[0...ind] + str[ind+1..-1]
#         sub_perms = perms(sub_str)
#         sub_perms.each do |sp|
#           all_perms << char + sp
#         end
#       end
#     elsif counter == 2
#       all_perms << str[0] + str[1]
#       all_perms << str[1] + str[0]
#     elsif counter == 1
#       all_perms << str
#     end
#     str.chop!
#     counter -= 1
#     break if counter == 0
#   end
#   result = all_perms.uniq.select { |sub| sub if sub.to_i.odd? }
  
# end

# # p perms("abc")
# p perms("1341")