def going(n)
  numer = []
  n.downto(1) do |i|
    numer << (1..i).inject(:*)
  end
  denom = (1..n).inject(:*)
  (numer.sum / denom.to_f).truncate(6)
end

p going(5)
p going(6)
p going(7)
p going(200)

# note that this algo cant handle large inputs and will instead return NaN, need to reconfigure entire code
