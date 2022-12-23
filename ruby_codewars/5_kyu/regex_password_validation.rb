# https://www.codewars.com/kata/52e1476c8147a7547a000811/train/ruby

# You need to write regex that will validate a password to make sure it meets the following criteria:

# At least six characters long
# contains a lowercase letter
# contains an uppercase letter
# contains a digit
# only contains alphanumeric characters (note that '_' is not alphanumeric)

# C
# cant use \w because would include _
# attempt1: # str.match?(/(?=[a-zA-Z0-9]*[a-z])(?=[a-zA-Z0-9]*[A-Z])(?=[a-zA-Z0-9]*[0-9])([a-zA-Z0-9]{6})/)
# (?=[a-zA-Z0-9]*[a-z]) -- positive lookaround for a lower case letter
# (?=[a-zA-Z0-9]*[A-Z]) -- positive lookaround for an upper case letter
# (?=[a-zA-Z0-9]*[0-9]) -- positive lookaround for a number
# ([a-zA-Z0-9]{6}) -- at least 6 characters long

# the only thing that i cant figure out is how to more explicitly restrict characters to just alphanumerics ... tried this to no avail (^?![a-zA-z0-9]+$)
# all tests are testing correctly except for 'fjd3IR9.;' (i assume bc my regex is not recognizing either . or ; as an issue)

# attempt2 (required googling to piece together, biggest piece i was misisng in attempt 1 was starting and ending the expression with ^ and $

def regex(str)
  # str.match?(/(?=[a-zA-Z0-9]*[a-z])(?=[a-zA-Z0-9]*[A-Z])(?=[a-zA-Z0-9]*[0-9])([a-zA-Z0-9]{6})/)
  str.match?(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/)
end


p regex('fjd3IR9') # true)
p regex('ghdfj32') # false)
p regex('DSJKHD23') # false)
p regex('dsF43') # false)
p regex('4fdg5Fj3') # true)
p regex('DHSJdhjsU') # false)

p regex('fjd3IR9.;') # false) --

p regex('fjd3  IR9') # false)
p regex('djI38D55') # true)
p regex('a2.d412') # false)
p regex('JHD5FJ53') # false)
p regex('!fdjn345') # false)
p regex('jfkdfj3j') # false)
p regex('123') # false)
p regex('abc') # false)
p regex('123abcABC') # true)
p regex('ABC123abc') # true)
p regex('Password123') # true)

# codwars additional option pasted below for reference
regex = /(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])^[a-zA-Z0-9]{6,}$/

# explanation
# The ?= in (?=pattern) is called a 'positive lookahead'.

# The lookahead is non-capturing, so it ensures that the pattern exists, but it doesn't include the pattern in the final match. The .* part in each of the lookahead groups matches any character, and it is necessary because it allows all three lookahead groups to match, regardless of the order in which they occur.

# After the presence of an uppercase letter, a lowercase letter, and a number has been confirmed, the capturing portion of the regex begins. The ^ matches the beginning of the line, the $ matches the end of the line, and the {6,} part matches a minimum of 6 characters. This syntax takes the form {min, max}, and matches on the preceding group. For example, /ab{2, 3}c/ would match abbc or abbbc, but not abc or abbbbc.

# So for the solution to this kata, ^[a-zA-Z0-9]{6,}$ matches any string that is at least 6 characters long and contains only alphanumeric characters. There is no maximum number of characters. The preceding lookahead groups ensure that there is at least one character in each group (lowercase, uppercase, and number). The lookahead groups act as a prerequisite, and are discarded when considering the final match, which corresponds to ^[a-zA-Z0-9]{6,}$