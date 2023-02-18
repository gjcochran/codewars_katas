def solve(arr)
  letts = ('a'..'z').to_a
  alph = (0..25).each_with_object ({}) { |el, h| h[el] = letts[el] }

  results = arr.map { |str| str.chars.select.with_index { |c, i| c.downcase == alph[i] }}
  results.map(&:size)
end

p solve(["abode", 'ABc', "xyzD"])

# rather than using each_with_object, could ...
# `alph = Array(0..25).zip('a'..'z').to_h`
