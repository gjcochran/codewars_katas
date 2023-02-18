def bin_to_dec(bin_num)
  int = 0
  rev = bin_num.to_s.reverse.chars
  rev.each_with_index { |n, i| int += n.to_i * (2**i) }
  int
end

def dec_to_bin(dec_num)
  sprintf("%032b", dec_num.to_i)
end

def int32_to_ip(int32)
  full_bin = dec_to_bin(int32)
  split_bin_arr = full_bin.scan(/.{8}/)
  split_bin_arr.map { |sub| bin_to_dec(sub) }.join('.')
end

p int32_to_ip(2154959208)
p int32_to_ip(0)
p int32_to_ip(634542892)

# works. codewars answer is a little out of my depth, written for ref

# [24, 16, 8, 0].collect { |b| (int32 >> b) & 255 }.join('.')

#
