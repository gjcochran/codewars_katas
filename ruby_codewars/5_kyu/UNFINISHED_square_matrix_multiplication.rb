def matrix_mult(a, b)
  result = []

  a.size.times do |i|
    a.size.times do |e|
      a[i][e] * b[e][i]
    end
  end
end

p matrix_mult([[1, 2], [3, 2]], [[3, 2], [1, 1]])
