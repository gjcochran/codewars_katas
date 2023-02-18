def pairs(arr)
  arr.tally.reject { |k, v| v == 1 }.values.sum / 2
end

p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2] )

# note cwars alternate answer using group_by
# `arr.group_by { |x| x }.sum { |x, y| y.size / 2 }`
