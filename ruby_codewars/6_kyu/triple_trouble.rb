# https://www.codewars.com/kata/55d5434f269c0c3f1b000058/train/ruby

# Write a function

# triple_double(num1, num2)
# which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

# If this isn't the case, return 0

# Examples
# triple_double(451999277, 41177722899) == 1
# # num1 has straight triple 999s and  num2 has straight double 99s

# triple_double(1222345, 12345) == 0
# # num1 has straight triple 2s but num2 has only a single 2

# triple_double(12345, 12345) == 0

# triple_double(666789, 12345667) == 1

# D/A
# going to num.to_s.chars and count each number as a hash
# same thing with num2 in a 2nd hash
# select k/v pairs from num1 >=3 & from num2 >=2
# then if/else
# to determine if same

# def triple_double(num1, num2)
#   arr1 = num1.to_s.chars
#   arr2 = num2.to_s.chars
#   hsh1 = arr1.each_with_object ({}) { |el, h| h[el] = arr1.count(el) }
#   hsh2 = arr2.each_with_object ({}) { |el, h| h[el] = arr2.count(el) }
#   sel1 = hsh1.select { |k, v| v >= 3 }
#   sel2 = hsh2.select { |k, v| v >= 2 }
#   sel1.keys.select { |el| sel2.keys.include?(el) }.empty? ? 0 : 1
#   p hsh1
#   p hsh2
#   p sel1
#   sel2
# end

# p triple_double(451999277, 41177722899) # 1)
# p triple_double(1222345, 12345) # 0)
# p triple_double(12345, 12345) # 0)
# p triple_double(666789, 12345667) # 1)
# p triple_double(10560002, 100) # 1)
# p triple_double(1112, 122) # 0)
# p triple_double(352025279029027397, 251530041011400009) # 0) 

# note that this did not work BECAUSE I DID NOT FOLLOW INSTRUCTIONS AND COUNTED ALL CHARS, BUT THE INSTRUCTIONS ARE THAT THEY MUST BE IN A ROW!

# attempt2

def triple_double(num1, num2)
  arr1 = num1.to_s.chars
  arr2 = num2.to_s.chars

  a3 = arr1.select.with_index { |_, idx| arr1[idx] == arr1[idx+1] && arr1[idx] == arr1[idx+2] }
  a4 = arr2.select.with_index { |_, idx| arr2[idx] == arr2[idx+1] }

  a3.select { |el| a4.include?(el) }.empty? ? 0 : 1
end

p triple_double(451999277, 41177722899) # 1)
p triple_double(1222345, 12345) # 0)
p triple_double(12345, 12345) # 0)
p triple_double(666789, 12345667) # 1)
p triple_double(10560002, 100) # 1)
p triple_double(1112, 122) # 0)
p triple_double(352025279029027397, 251530041011400009) # 0) 

# clever codewars solution pasted below

# def triple_double(num1,num2)
#   num1 = num1.to_s
#   num2 = num2.to_s
#   10.times do |i|
#     if num1.include?(i.to_s*3) && num2.include?(i.to_s*2)
#       return 1
#     end
#   end
#   return 0
# end