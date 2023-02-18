def find_missing_v1(seq)
  res = []
  0.upto(seq.size - 2) do |i|
    res << (seq[i + 1] - seq[i])
  end
  gap = res.select { |n| res.count(n) == 1 }.first
  gap_idx = res.index(gap)
  seq[gap_idx] + res.select { |n| res.count(n) > 1 }.first
end

p find_missing_v1([1, 3, 5, 9, 11])

# too slow, trying again...

def find_missing(seq)
  exp_add = (seq[-1] - seq[0]) / seq.size

  counter = 0
  loop do 
    if seq[counter] + exp_add == seq[counter + 1]
      counter += 1
      next
    else
      break
    end
  end
  seq[counter] + exp_add
end

p find_missing([1, 3, 5, 9, 11])

# review: second answer worked.
# note that cw solution is very clever...
# `(seq[0] + seq[1]) * (seq.size + 1) / 2 - seq.sum`
