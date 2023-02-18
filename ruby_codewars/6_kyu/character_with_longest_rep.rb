def longest_repetition_1st(str)
  a = str.chars
  result = {}
  a.each { |l| result[l] = a.count(l) }
  result.max_by { |_, v| v }
end

# note that the above is incorrect because needs to be longest consecutive!!

def longest_repetition(str)
  a = str.each_char.chunk_while { |a, b| a == b }.map(&:join)
  cts = a.map { |sub| [sub[0], sub.size] }
  cts.max_by { |s| s[1] }
end


p longest_repetition('cdeuuu900')
