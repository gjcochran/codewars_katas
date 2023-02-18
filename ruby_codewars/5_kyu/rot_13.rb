def rot13(message)
  alph = ('a'..'z').to_a
  hsh = (1..26).each_with_object ({}) { |el, h| h[el] = alph[el - 1] }
  to_change = message.chars
  result = to_change.map do |el|
    if hsh.values.include?(el.downcase)
      n = hsh.key(el.downcase)
      m = n + 13
      (m <= 26) ? (num = m) : (num = m - 26)

      (el.upcase) == el ? hsh[num].upcase : hsh[num]
    else
      el
    end
  end
  result.join
end

p rot13('EBG13 rknzcyr')

# works, could have just used `tr` method!
# `message.tr('a-zA-Z', 'n-za-mN-ZA-M')`
