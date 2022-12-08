# https://www.codewars.com/kata/5544c7a5cb454edb3c000047

# A child is playing with a ball on the nth floor of a tall building. The height of this floor above ground level, h, is known.

# He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce of 0.66).

# His mother looks out of a window 1.5 meters from the ground.

# How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?

# Three conditions must be met for a valid experiment:
# Float parameter "h" in meters must be greater than 0
# Float parameter "bounce" must be greater than 0 and less than 1
# Float parameter "window" must be less than h.
# If all three conditions above are fulfilled, return a positive integer, otherwise return -1.

# Note:
# The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.

# Examples:
# - h = 3, bounce = 0.66, window = 1.5, result is 3

# - h = 3, bounce = 1, window = 1.5, result is -1 

# (Condition 2) not fulfilled).

# D/A
# loop with product equaling h *= bounce and counter (starts at 1 to include fall) going up by 2 (bouncing up and bouncing down) until h < 1.5

# if h > 0 && bounce > 0 && bounch < 1 && window < h

def bouncingBall(h, bounce, window)
  if h > 0 && bounce > 0 && bounce < 1 && window < h
    counter = 1
    product = h
    loop do
      product *= bounce
      counter += 2 if product > window
      break if product < window
    end
    counter
  else
    -1
  end
end

p bouncingBall(3, 0.66, 1.5) #=> 3)
p bouncingBall(30, 0.66, 1.5) #=> 15)
p bouncingBall(30, 0.75, 1.5) #=> 21)
p bouncingBall(30, 0.4, 10) #=> 3)
p bouncingBall(40, 1, 10) #=> -1)
p bouncingBall(-5, 0.66, 1.5) #=> -1)

# recursive example from codewars pasted below for reference
# def bouncingBall(h, bounce, window)
#   bounce < 0 || bounce >= 1 || h <= window || window < 0 ? -1 : bouncingBall(h * bounce, bounce, window) + 2
# end