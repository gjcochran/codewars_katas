# https://www.codewars.com/kata/583203e6eb35d7980400002a/train/ruby

# Given an array (arr) as an argument complete the function countSmileys that should return the total number of smiling faces.

# Rules for a smiling face:

# Each smiley face must contain a valid pair of eyes. Eyes can be marked as : or ;
# A smiley face can have a nose but it does not have to. Valid characters for a nose are - or ~
# Every smiling face must have a smiling mouth that should be marked with either ) or D
# No additional characters are allowed except for those mentioned.

# Valid smiley face examples: :) :D ;-D :~)
# Invalid smiley faces: ;( :> :} :]

# Example
# countSmileys([':)', ';(', ';}', ':-D']);       // should return 2;
# countSmileys([';D', ':-(', ':-)', ';~)']);     // should return 3;
# countSmileys([';]', ':[', ';*', ':$', ';-D']); // should return 1;

# D/A
# regex with select and match

def count_smileys(arr)
  arr.select { |el| el.match?(/[:;][-~]*[\)D]/) }.size
end

p count_smileys([]) # 0)
p count_smileys([":D",":~)",";~D",":)"]) # 4)
p count_smileys([":)",":(",":D",":O",":;"]) # 2)
p count_smileys([";]", ":[", ";*", ":$", ";-D"]) # 1)
p count_smileys([";", ")", ";*", ":$", "8-D"]) # 0)

# several codewars options to compare
# def count_smileys(arr)
#   arr.grep(/[:;][-~]?[)D]/).size
# end

# def count_smileys(arr)
#   arr.count { |e| e =~ /(:|;){1}(-|~)?(\)|D)/ }
# end

# def count_smileys(arr)
#   arr.count { |e| e =~ /[:;]{1}[-~]?[)D]/ }
# end