def hex_to_rgb(str)
  arr = str[1..-1].scan(/../)
  { r: arr[0].hex, g: arr[1].hex, b: arr[2].hex }
end

p hex_to_rgb("#FF9933")
