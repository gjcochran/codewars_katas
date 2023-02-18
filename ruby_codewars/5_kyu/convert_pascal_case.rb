def to_underscore(str)
  return str.to_s if str.is_a?(Integer)
  arr = str.chars
  indices = []

  arr.each_with_index { |c, i| indices << i if c == c.upcase && c =~ /[a-zA-Z]/ }
  indices.each_with_index { |n, i| arr.insert((n+i), ' ') }

  arr.join.downcase.strip.tr(' ', '_')
end

p to_underscore("TestController")

# works but there are several simpler ways to do this using regex...
# `str.to_s.split(/(?=[A-Z])/).join('_').downcase`
# `str.to_s.gsub(/(.)([A-Z])/, '\1_\2').downcase`

