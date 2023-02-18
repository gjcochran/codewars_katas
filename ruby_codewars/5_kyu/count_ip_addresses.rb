def bin_to_dec(bin_num)
  int = 0
  rev = bin_num.to_s.reverse.chars
  rev.each_with_index { |n, i| int += n.to_i * (2**i) }
  int
end

def ipsBetween(st, en)
  first_ips = st.split('.').map { |n| sprintf("%08b", n) }.join
  second_ips = en.split('.').map { |n| sprintf("%08b", n) }.join

  num1 = bin_to_dec(first_ips) 
  num2 = bin_to_dec(second_ips)

  num2 - num1
end

p ipsBetween("20.0.0.10", "20.0.1.0")
