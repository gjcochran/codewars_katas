def multiplication_table(size)
  res = []
  res << (1..size).to_a
  1.upto(size - 1) do |i|
    res << [res[0][i]]
    1.upto(size - 1) { |c| res[i] << res[0][c] * res[i].first }
  end
  res
end

p multiplication_table(3)
p multiplication_table(5)

# works. cw best solution used the Range#step method, written below for ref
# `(1..size).map { |i| (i..size * i).step(i).to_a }`
