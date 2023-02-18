def parts_sums_v1(ls)
  a = ls.clone
  result = []
  (ls.size + 1).times do |i|
    result << a.sum
    a.shift
  end
  result
end

p parts_sums_v1([0, 1, 3, 6, 10])

# works but not for array length of 447158 test in codewars...

def parts_sums_v2(ls)
  r = ls.map.with_index { |n, idx| ls[idx..-1].sum }
  r.push(0)
end

p parts_sums_v2([0, 1, 3, 6, 10])

# is faster than v1 but still fails on array length 981459 in cw tests
 
def parts_sums_v3(ls)
  a = ls.clone
  result = []
  while a.size > 0 
    result << a.sum
    a.shift
  end
  result.push(0)
end

p parts_sums_v3([0, 1, 3, 6, 10])

# still too slow.. v2 was fasted option, thus far... v3 got to array length 436696
# using with_index method creates additional objects, will try without...

def parts_sums(ls)
  r = []
  ls.each_index { |idx| r << ls[idx..-1].sum }
  r.push(0)
end

p  parts_sums([0, 1, 3, 6, 10])

# slowest yet... only got to 414185 
