# https://www.codewars.com/kata/52f787eb172a8b4ae1000a34/train/ruby

# Write a program that will calculate the number of trailing zeros in a factorial of a given number.

# N! = 1 * 2 * 3 *  ... * N

# Be careful 1000! has 2568 digits...

# For more info, see: http://mathworld.wolfram.com/Factorial.html

# Examples
# zeros(6) = 1
# # 6! = 1 * 2 * 3 * 4 * 5 * 6 = 720 --> 1 trailing zero

# zeros(12) = 2
# # 12! = 479001600 --> 2 trailing zeros
# Hint: You're not meant to calculate the factorial. Find another way to find the number of zeros.

# D/A
# one zero is added every 5...
  
  # irb(main):005:0> (1..4).inject(:*) # 4 => 0
  # => 24
  # irb(main):006:0> (1..5).inject(:*) # 5 => 1
  # => 120
  # irb(main):010:0> (1..9).inject(:*) # 9 => 1
  # => 362880
  # irb(main):011:0> (1..10).inject(:*) # 10 => 2
  # => 3628800
  # irb(main):012:0> (1..14).inject(:*) # 14 => 2
  # => 87178291200
  # irb(main):013:0> (1..15).inject(:*) # 15 => 3
  # => 1307674368000
  # irb(main):015:0> (1..19).inject(:*) # 19 => 3
  # => 121645100408832000
  # irb(main):016:0> (1..20).inject(:*) # 20 => 4
  # => 2432902008176640000
  # irb(main):017:0> (1..24).inject(:*) # 24 => 4
  # => 620448401733239439360000
  # irb(main):018:0> (1..25).inject(:*) # # 25 => 6 # rule breaks at 25!
  # => 15511210043330985984000000
  #   irb(main):023:0> (1..29).inject(:*) # 29 => 6
  # => 8841761993739701954543616000000
  # irb(main):024:0> (1..30).inject(:*) # 30 => 7
  # => 265252859812191058636308480000000
  # irb(main):025:0> (1..34).inject(:*) # 34 => 7
  # => 295232799039604140847618609643520000000
  # irb(main):026:0> (1..35).inject(:*) # 35 => 8
  # => 10333147966386144929666651337523200000000
  # irb(main):027:0> (1..39).inject(:*) # 39 => 8
  # => 20397882081197443358640281739902897356800000000
  # irb(main):028:0> (1..40).inject(:*) # 40 => 9
  # => 815915283247897734345611269596115894272000000000
  # irb(main):029:0> (1..44).inject(:*) # 44 => 9
  # => 2658271574788448768043625811014615890319638528000000000
  # irb(main):030:0> (1..45).inject(:*) # 45 => 10
  # => 119622220865480194561963161495657715064383733760000000000
  # irb(main):031:0> (1..49).inject(:*) # 49 => 10
  # => 608281864034267560872252163321295376887552831379210240000000000
  # irb(main):032:0> (1..50).inject(:*) # 4 => 50 => 12
  # => 30414093201713378043612608166064768844377641568960512000000000000

# rule ... every 5 increment by 1 excexpt for every 25 increment by 2
# n
# 0-4 => 0
# 5-9 => 1
# 10-14 => 2
# 15-19 => 3
# 20-24 => 4
# 25-29 => 6
# 30-34 => 7

# n / 5 + n / 25 

# note that this might break again in squares of 25 ...?
# test:
# n = 119 => 27
# n = 124 => 28
# n = 125 => 31
# n = 130 => 32 
# validated

# can figure out the reverse of exponent (ie ** ) with Math.log(x, base), then need to round down to nearest whole integer with to_i 

# 5 ** 1 -- % 5 ... 1
# 5 ** 2 -- % 25 ... 2
# 5 ** 3 -- % 125 ... 3
# 5 ** 4 -- % 625 ... 4
# etc

# ex.
# n = 130 => 32 ## (130 / 5) + 1 (@ 25, 50, 75, 100) + 2 (@125) ## 26 + 4 
# + 2 |||| 130.divmod(5) + 130.divmod(25) + 130.divmod(125)  ## 26 + 5 + 1 #=> 32
# Math.log(130, 5).to_i => 3

def zeros(n)
  return 0 if n.zero?
  exp = Math.log(n, 5).to_i
  sum = 0
  exp.downto(1) do |i|
    sum += n.divmod(5 ** i).first
  end
  sum
end

p zeros(0) # 0
p zeros(6) # 1
p zeros(30) # 7
p zeros(50) # 12
p zeros(130) # 32

# codwars answer
# def zeros(n)
#   (1..Math.log(n, 5)).inject(0) { |sum, k| sum + n / 5**k }
# end

# codewars recursive answer
# def zeros(n)
# 	n < 5 ? 0 : (n / 5) + zeros(n / 5)
# end