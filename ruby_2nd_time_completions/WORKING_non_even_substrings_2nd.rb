def solve(s)
  arr = s.chars
  storage = []
  arr.size.downto(1) do |i|
    arr.combination(i) { |c| storage << c.join } 
  end
  storage.select! { |sub| s.match?(sub) }
  storage.map(&:to_i).select(&:odd?)
end

p solve('1341')
p solve('1347231')
