# https://www.codewars.com/kata/581e014b55f2c52bb00000f8

# You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

# For each word:

# the second and the last letter is switched (e.g. Hello becomes Holle)
# the first letter is replaced by its character code (e.g. H becomes 72)
# Note: there are no special characters used, only letters and spaces

# Examples

# decipherThis('72olle 103doo 100ya'); // 'Hello good day'
# decipherThis('82yade 115te 103o'); // 'Ready set go'

  # irb(main):002:0> 'H'.ord
  # => 72

#   irb(main):037:0> str[0]+str[-1]+str[2..-2]+str[1]
# => "holle"

def decipher_this(sentence)
  array = sentence.split.map do |str|
    nums = ('0'..'9').to_a
    arr = str.chars
    first = arr.select { |el| nums.include?(el) }.join.to_i.chr
    arr = arr.reject { |el| nums.include?(el) }
    arr.unshift(first)
    result = arr.join
    if result.size > 2
      result[0]+result[-1]+result[2..-2]+result[1]
    else
      result
    end
  end
  array.join(' ')
end

# p decipher_this('72olle')#; // 'Hello'
# p decipher_this('72olle 103doo 100ya')#; // 'Hello good day'
p decipher_this('82yade 115te 103o')#; // 'Ready set go'

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") # "A wise old owl lived in an oak")
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") # "The more he saw the less he spoke")
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") # "The less he spoke the more he heard")
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") # "Why can we not all be like that wise old bird")
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") # "Thank you Piotr for all your help")