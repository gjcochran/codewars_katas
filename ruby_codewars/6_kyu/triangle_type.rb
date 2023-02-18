def triangle_type(a, b, c)
  sides = [a, b, c]
  max_side = sides.max
  other_sides = sides.clone
  other_sides.delete_at(sides.index(max_side))
  other_sides_sum = other_sides.sum
  return 0 if max_side >= other_sides_sum

  max_sqd = max_side ** 2
  other_sqd = other_sides.map { |e| e ** 2 }.sum
  
  if max_sqd == other_sqd
    2
  elsif max_sqd > other_sqd
    3
  else
    1
  end
end

p triangle_type(8, 5, 7)
p triangle_type(3, 4, 5)
