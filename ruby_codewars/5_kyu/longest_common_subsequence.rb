def lcs(x, y)
  x_combs = []
  y_combs = []

  1.upto(x.size) do |i|
    x.chars.combination(i) { |c| x_combs << c } 
  end
  1.upto(y.size) do |i|
    y.chars.combination(i) { |c| y_combs << c }
  end
  
  in_common = x_combs.intersection(y_combs) 
  return '' if in_common.empty?
  in_common.sort_by(&:size).last.join
end

p lcs('abcdef', 'abc')
p lcs('abcdef', 'abf')
p lcs('132535365', '123456789')
p lcs('a', 'b')
