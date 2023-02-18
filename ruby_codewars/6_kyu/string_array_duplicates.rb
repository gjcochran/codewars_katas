def dup(arr)
  sep = arr.map { |s| s.chars.chunk_while { |i, j| i == j} }
  sep.map { |a| a.map { |arr| arr.uniq }.join } 
end

p dup(["ccooddddddewwwaaaaarrrrsssss","piccaninny","hubbubbubboo"])

# works but complicated. could have simply solved w ... `arr.map(&:squeeze)`
