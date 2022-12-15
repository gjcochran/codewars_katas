# https://www.codewars.com/kata/525f3eda17c7cd9f9e000b39/train/ruby

# This time we want to write calculations using functions and get the results. Let's have a look at some examples:

# seven(times(five)) # must return 35
# four(plus(nine)) # must return 13
# eight(minus(three)) # must return 5
# six(divided_by(two)) # must return 3
# Requirements:

# There must be a function for each number from 0 ("zero") to 9 ("nine")
# There must be a function for each of the following mathematical operations: plus, minus, times, divided_by
# Each calculation consist of exactly one operation and two numbers
# The most outer function represents the left operand, the most inner function represents the right operand
# Division should be integer division. For example, this should return 2, not 2.666666...:
# eight(divided_by(three))

def zero
end
def one
end
def two
end
def three
end
def four
end
def five
end
def six
end
def seven
end
def eight
end
def nine
end
def plus
end
def minus
end
def times
end
def divided_by
  
end

p seven(times(five())), 35
p four(plus(nine())), 13
p eight(minus(three())), 5
p six(divided_by(two())), 3