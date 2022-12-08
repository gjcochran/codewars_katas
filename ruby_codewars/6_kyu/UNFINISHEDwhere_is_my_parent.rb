# Mothers arranged a dance party for the children in school. At that party, there are only mothers and their children. All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night and no one can see each other. But you were flying nearby and you can see in the dark and have ability to teleport people anywhere you want.

# Legend:
# -Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
# -Function input: String contains only letters, uppercase letters are unique.
# Task:
# Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".

# def find_children(str)
#   a = str.chars.sort(&:casecmp).join
#   a.scan(/\w/)
# end


# attempt2

# thinking could make a hash like { A: 1, a: 2, B: 3, etc...} then find a way to sort the string by the hash values, not sure how that would work but sort&:casecamp and sort_by&:downcase did not work in attempt #1 bc they didnt always put the Capital letter first

p find_children("abBA") #=> "AaBb")
p find_children("AaaaaZazzz") #=> "AaaaaaZzzz")
p find_children("CbcBcbaA") #=> "AaBbbCcc")
p find_children("xXfuUuuF") #=> "FfUuuuXx")
p find_children("") #=> "")