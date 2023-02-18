def sum_consecutives(list)
  grouped = list.chunk_while { |a, b| a == b }
  result = []
  grouped.each { |arr| result << arr }
  result.map { |g| g.sum }
end

p sum_consecutives([1,4,4,4,0,4,3,3,1])

# codewars answer that like... `list.chunk_while(&:==).map(&:sum)`
