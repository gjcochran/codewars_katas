def solution(n)
  (1..n).to_a.join.chars.map(&:to_i).sum
end

p solution(12)
