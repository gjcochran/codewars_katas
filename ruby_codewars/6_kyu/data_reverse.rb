def data_reverse(data)
  data.join.scan(/.{8}/).reverse.map { |s| s.scan(/\d/).map(&:to_i) }.flatten
end

p data_reverse([1,1,1,1,1,1,1,1, 0,0,0,0,0,0,0,0, 0,0,0,0,1,1,1,1, 1,0,1,0,1,0,1,0])

# review: worked but did more than necessary
# could haved used each_slice method
# `data.each_slice(8).to_a.reverse.flatten`
