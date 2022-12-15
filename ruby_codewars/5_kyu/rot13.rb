# https://www.codewars.com/kata/530e15517bc88ac656000716/train/ruby

# ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after it in the alphabet. ROT13 is an example of the Caesar cipher.

# Create a function that takes a string and returns the string ciphered with Rot13. If there are numbers or special characters included in the string, they should be returned as they are. Only letters from the latin/english alphabet should be shifted, like in the original Rot13 "implementation".

DOWN = ('a'..'z').to_a
UP = ('A'..'Z').to_a

def rot13(str)
  p str
  result = str.chars.map do |sub|
    if DOWN.include?(sub)
      idx = ((DOWN.index(sub)) + 13).divmod(26)
      DOWN[idx[1]]
    elsif UP.include?(sub)
      idx = ((UP.index(sub)) + 13).divmod(26)
      UP[idx[1]]
    else
      sub
    end
  end
  result.join 
end

p rot13('abcdefF7&:uI')

# codewars answers below

# def rot13(string)
#   string.tr("A-Za-z", "N-ZA-Mn-za-m")
# end

# def rot13(string)
#   origin = ('a'..'z').to_a.join + ('A'..'Z').to_a.join
#   cipher = ('a'..'z').to_a.rotate(13).join + ('A'..'Z').to_a.rotate(13).join
#   string.tr(origin, cipher)
# end

# https://docs.ruby-lang.org/en/3.1/String.html#method-i-tr
# Returns a copy of str with the characters in from_str replaced by the corresponding characters in to_str