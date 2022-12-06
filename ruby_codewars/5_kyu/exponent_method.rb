# https://www.codewars.com/kata/5251f63bdc71af49250002d8

# Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second. Return nil if the second argument is negative.

# Note: The ** operator has been disabled.

# Examples:

# power(2, 3) # 8
# power(10, 0) # 1
# power(-5, 3) # -125
# power(-4, 2) # 16

def power(base, exponent)
  if exponent >= 0
    arr = [1]
    exponent.times do
      arr << base
    end
    arr.inject(:*)
  else
    nil
  end
end

p power(2, 3) # 8
p power(10, 0) # 1
p power(-5, 3) # -125
p power(-4, 2) # 16

# codewars solution below for reference

# def power(base, exponent)
#   exponent.times.inject(1){ |product| product * base } unless exponent < 0
# end