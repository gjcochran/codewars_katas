# https://www.codewars.com/kata/5842df8ccbd22792a4000245

# You will be given a number and you will need to return it as a string in Expanded Form. For example:

# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
# NOTE: All numbers will be whole numbers greater than 0.

# D/A

# num % 10 = a 
# (num - a) % 100 = b
# etc .. 
# stop when zeros in 100 are greater equal to num.size

# C

def expanded_form(num)
  arr = []
  counter = 1
  working = num
  loop do
    mod = working % (10 * counter)
    arr << mod.to_s if mod.positive?
    working -= mod
    counter *= 10
    break if counter.to_s.size > num.to_s.size 
  end
  arr.reverse.join(' + ')
end

p expanded_form(12)
p expanded_form(42)
p expanded_form(70304)

# codewars solution below
# def expanded_form(num)
#   num.to_s
#      .chars
#      .reverse
#      .map.with_index { |d, idx| d.to_i * 10**idx }
#      .reject(&:zero?)
#      .reverse
#      .join (' + ')
# end

  # irb(main):030:0> num
  # => 70304
  # irb(main):031:0> num.to_s.chars.reverse
  # => ["4", "0", "3", "0", "7"]
  # irb(main):032:0> num.to_s.chars.reverse.map.with_index { |d, idx| d.to_i * 10**idx }
  # => [4, 0, 300, 0, 70000]
