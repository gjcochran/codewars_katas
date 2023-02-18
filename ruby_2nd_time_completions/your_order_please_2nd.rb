# task: sort a string
#   wherein each substring contains on number 1..9
#   that num in sub determines new index of sub in returned string

def order(words)
  arr = words.split
  hash = (1..9).each_with_object ({}) { |el, h| h[el] = '' }

  1.upto(9) do |i|
    arr.each { |word| word.include?(i.to_s) ? hash[i] = word : next }
  end

  hash.values.select { |v| v != '' }.join(' ')
end

p order("is2 Thi1s T4est 3a")

# works... but could have just used sort_by. note to self that originally tried
# sort_by, couldn't figure out, and then adjusted to using each and hash filling
#
# `words.split.sort_by { |w| w[/\d/] }.join(' ')`
