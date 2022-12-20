# https://www.codewars.com/kata/5208f99aee097e6552000148/train/ruby

# Complete the solution so that the function will break up camel casing, using a space between words.

# Example
# "camelCasing"  =>  "camel Casing"
# "identifier"   =>  "identifier"
# ""             =>  ""

# note that `?=` is known as a positive lookahead expression so that keep the character that split by
def solution(str)
  str.split(/(?=[A-Z])/).join(' ')
end

p solution('camelCasing') # 'camel Casing')
p solution('camelCasingTest') # 'camel Casing Test')
p solution("identifier")
p solution("")

# codewars... how do this with gsub, answers pasted below
# def solution(string)
#   string.gsub /([A-Z])/, ' \1'
# end

# def solution(string)
#   string.gsub(/(?=[A-Z])/, ' ')
# end