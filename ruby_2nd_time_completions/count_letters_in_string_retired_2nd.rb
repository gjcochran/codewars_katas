def letter_count(str)
  arr = str.chars
  hsh = arr.each_with_object ({}) { |el, h| h[el.to_sym] = arr.count(el) }
  hsh.sort_by { |k, v| k }.to_h
end

p letter_count('codewars')
p letter_count('activity')
