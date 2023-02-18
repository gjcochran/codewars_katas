def solve(s)
  scale = {}
  ('a'..'z').each_with_index { |l, i| scale[l] = i+1 }
  result = []
  a = s.split(/[aeiou]/)
  a.each do |sub|
    temp = 0
    sub.each_char { |l| temp += scale[l] if scale.keys.include?(l) } 
    result << temp
  end
  result.max
end

p solve('zodiacs')
