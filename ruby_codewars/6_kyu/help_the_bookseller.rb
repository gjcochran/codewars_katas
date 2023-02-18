def stockList(books, categories)
  return '' if books.empty? || categories.empty?
  result = []
  hsh = Hash.new 
  categories.each { |letter| hsh[letter] = 0 }
  categories.each { |l| books.each { |b| hsh[l] += b.gsub(/\D/, '').to_i if b.start_with?(l) }}
  hsh.each { |k, v| result << ["(#{k} : #{v})"] }
  result.join(' - ')
end

book_list =  ["ABAR 200", "CDXE 500", "BKWR 250", "BTSQ 890", "DRTY 600"]
cat_list = ['A', 'B']
p stockList(book_list, cat_list)

# review: good.
