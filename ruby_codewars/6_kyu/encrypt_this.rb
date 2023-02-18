def encrypt_this(text)
  text.split.each do |word|
    word[1], word[-1] = word[-1], word[1] if word.size > 1
    word[0] = word[0].ord.to_s
  end.join(' ')
end

p encrypt_this('A wise old owl lived in')
