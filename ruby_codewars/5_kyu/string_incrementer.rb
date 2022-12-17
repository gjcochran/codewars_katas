# https://www.codewars.com/kata/54a91a4883a7de5d7800009c/train/ruby

# write a function which increments a string, to create a new string.

# If the string already ends with a number, the number should be incremented by 1.
# If the string does not end with a number. the number 1 should be appended to the new string.
# Examples:

# foo -> foo1

# foobar23 -> foobar24

# foo0042 -> foo0043

# foo9 -> foo10

# foo099 -> foo100

    # irb(main):001:0> 0042
    # => 34

# Attention: If the number has leading zeros the amount of digits should be considered.

def increment_string(input)

end

p increment_string("foo") # "foo1")
p increment_string("foobar001") # "foobar002")
p increment_string("foobar1") # "foobar2")
p increment_string("foobar00") # "foobar01")
p increment_string("foobar99") # "foobar100")
p increment_string("") # "1")