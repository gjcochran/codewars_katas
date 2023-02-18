def thirt(n)
  mults = []
  n.to_s.size.times do |i|
    mults << (10**i) % 13
  end

  res = n
  loop do
    temp = []
    a = res.to_s.chars.map(&:to_i).reverse
    a.each_with_index { |n, i| temp << (n * mults[i]) }
    temp.sum == res ? break : (res = temp.sum)
  end
  res
end
 
p thirt(1234567)
