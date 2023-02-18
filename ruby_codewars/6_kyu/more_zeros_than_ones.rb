# to_s(2) 
# .ord
# .chr

def more_zeros(s) 
  to_test = [] 
  s.each_char { |c| to_test << c.ord.to_s(2) }
  tested = to_test.select { |num| num.count('0') > num.count('1')}
  tested.map { |n| n.to_i(2).chr }
end

p more_zeros('abcde')

# review: decent, works. simpler option from cw below
# s.chars.select { |c| c.ord.to_s(2).count('0') > c.ord.to_s(2).count('1') }.uniq
