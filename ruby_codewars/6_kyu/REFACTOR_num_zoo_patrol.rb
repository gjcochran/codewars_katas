def find_missing_number_v1(nums)
  return 1 if nums.empty?

  g = nums.sort.chunk_while { |i, j| j == i + 1 }.to_a

  if g.size == 1
    if nums.include?(1)
      g.first.last + 1
    else
      1
    end
  else
    g.first.last + 1
  end
end

# second attempt, first timed out in tests
# second also timed out, even if configed as `...each_with_index.lazy.select...first`

def find_missing_number(nums)
  return 1 if nums.empty?

  arr = nums.sort
  g = arr[0..-2].select.with_index { |e, i| e == arr[i+1] - 2 }
  if g.empty?
    if arr.first == 1
      arr.last + 1
    else
      1
    end
  else
    g.first + 1
  end
end

p find_missing_number([2, 3, 4])
p find_missing_number([1, 2, 4])
p find_missing_number([1, 2, 3])
