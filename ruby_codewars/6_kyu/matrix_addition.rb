def matrixAddition(a, b)
  result = []
  a.each_with_index do |row, ri|
    temp = []
    row.each_with_index do |col, ci|
      temp << a[ri][ci] + b[ri][ci] 
    end
    result << temp
  end
  result
end

p matrixAddition(
  [ [1, 2, 3],
    [3, 2, 1],
    [1, 1, 1] ],
  [ [2, 2, 1],
    [3, 2, 3],
    [1, 1, 3] ] )

# good, easy. note that could use zip with transpose for same result
# `a.zip(b).map { |r| r.transpose.map { |c| c.reduce(:+) } }`
