# https://www.codewars.com/kata/526571aae218b8ee490006f4/train/ruby

# Write a function that takes an integer as input, and returns the number of bits that are equal to one in the binary representation of that number. You can guarantee that input is non-negative.

# Example: The binary representation of 1234 is 10011010010,
#                                                 10011010010
#  so the function should return 5 in this case (ie how many 1s are in that binary number)

def count_bits(n)
  result = []
  loop do
    arr = n.divmod(2)
    n = arr[0]
    result << arr[1]
    break if arr[0] == 0
  end
  binary = result.reverse
  binary.select { |el| el == 1 }.size
end

p count_bits(1234)
p count_bits(0) # 0
p count_bits(4) # 1
p count_bits(7) # 3
p count_bits(9) # 2
p count_bits(10) # 2

# forgot that can change to different bases using to_s!!! codwars answer below
def count_bits_CW(n)
  n.to_s(2).count "1"
end
p count_bits_CW(1234)

# irb(main):013:0> 1234.to_s(2)
# => "10011010010"