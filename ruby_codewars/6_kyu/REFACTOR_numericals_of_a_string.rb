def numericals(str)
  str.chars.map.with_index { |e, i| str[0..i].count(e) }.join 
end

p numericals('Hello, World!')

# works but isnt efficent enough for cwars...
