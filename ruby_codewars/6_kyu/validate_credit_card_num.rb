def validate(n)
  a = n.to_s.chars.map(&:to_i)
  if a.size.odd?
    r = a.map.with_index { |e, i| i.odd? ? e*2 : e }
  else
    r = a.map.with_index { |e, i| i.even? ? e*2 : e }
  end
  r = r.map { |e| e > 9 ? e-9 : e }
  r.sum % 10 == 0
end

p validate(1714)
p validate(2121)
