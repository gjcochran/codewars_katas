def solve(s)
  s.scan(/[aeiou]+/).map(&:size).max
end

p solve("codewarriors")

