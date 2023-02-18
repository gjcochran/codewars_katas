def encode(s)
  code = { 'a' => 1, 'e' => 2, 'i' => 3, 'o' => 4, 'u' => 5 }
  s.chars.map { |l| code.keys.include?(l) ? code[l] : l }.join
end

p encode('hello')

def decode(s)
  code = { 'a' => 1, 'e' => 2, 'i' => 3, 'o' => 4, 'u' => 5 }
  s.chars.map { |l| code.values.include?(l.to_i) ? code.key(l.to_i) : l }.join
end

p decode('h2ll4')

# good lesson here from reviewing CW answers.. could have used `tr` method instead
# `s.tr('aeiou', '12345')`
