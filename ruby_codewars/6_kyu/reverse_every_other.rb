def reverse_alternate(string)
  a = string.split
  a.map.with_index { |e, i| i.odd? ? e.reverse : e }.join(' ')
end

p reverse_alternate("Did it work?")
p reverse_alternate("Reverse this string, please!")
