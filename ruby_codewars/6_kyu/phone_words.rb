# https://www.codewars.com/kata/635b8fa500fba2bef9189473/train/ruby

# turn  old cellphone texting integers into string ...
# 2 a
# 22 b
# 222 c
# etc
# 3 def
# 4 ghi
# 5 jkl
# 6 mno
# 7 pqrs
# 8 tuv
# 9 wxyz
# 0 space

# For example if you get "22" return "b", if you get "222" you will return "c". If you get "2222" return "ca".

# Further details:

# 0 is a space in the string.
# 1 is used to separate letters with the same number.
# always transform the number to the letter with the maximum value, as long as it does not have a 1 in the middle. So, "777777" -->  "sq" and "7717777" --> "qs".
# you cannot return digits.
# Given a empty string, return empty string.
# Return a lowercase string.
# Examples:
# "443355555566604466690277733099966688"  -->  "hello how are you"
# "55282"                 -->  "kata"
# "22266631339277717777"  -->  "codewars"
# "66885551555"           -->  "null"
# "833998"                -->  "text"
# "000"                   -->  "   "



def phone_words(str)
  CODE = { "0" => ' ', 
              "1" => '', 
              "2" => "a", 
              "22" => "b", 
              "222" => "c", 
              "3" => "d", 
              "33" => "e", 
              "333" => "f", 
              "4" => "g", 
              "44" => "h", 
              "444" => "i", 
              "5" => "j", 
              "55" => "k", 
              "555" => "l", 
              "6" => "m", 
              "66" => "n", 
              "666" => "o", 
              "7" => "p", 
              "77" => "q", 
              "777" => "r", 
              "7777" => "s", 
              "8" => "t", 
              "88" => "u", 
              "888" => "v", 
              "9" => "w", 
              "99" => "x", 
              "999" => "y", 
              "9999" => "x" }

  temp = []
  str.chars.chunk_while { |i, j| i == j }.each { |ar| temp << ar.join }
  p temp
  split_str = []
  temp.each do |el| 
     if el.include?('7') || el.include?('9')
      split_str << el.split(/(....)/).delete_if { |el| el.empty? }
     else
      split_str << el.split(/(...)/).delete_if { |el| el.empty? }
     end
  end
 comp = split_str.flatten    
 result = []
 comp.each { |el| }
end

# p phone_words('testtttinnng')

p phone_words("443355555566604466690277733099966688") #.to eq("hello how are you")
# p phone_words("55282") #.to eq("kata")
# p phone_words("44460208337777833777") #.to eq("im a tester")
# p phone_words("22266631339277717777") #.to eq("codewars")
# p phone_words("66885551555") #.to eq("null")
# p phone_words("833998") #.to eq("text")
# p phone_words("000") #to eq("   ")
# p phone_words("7999844666166") #.to eq("python")
# p phone_words("55886444833") #.to eq("kumite")
# p phone_words("271755533") #.to eq("apple")
# p phone_words("") #.to eq("")
# p phone_words("111") #.to eq("")