def solution(str, sub)
  str.scan(sub).size
end

p solution('aa_bb_cc_dd_bb_e', 'bb')
p solution('aaabbbcccc', 'bbb')
