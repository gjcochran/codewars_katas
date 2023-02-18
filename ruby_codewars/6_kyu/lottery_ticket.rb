# https://www.codewars.com/kata/57f625992f4d53c24200070e/train/ruby
# input: array of arrays and an integer 
#         each subarray is of length two with one string one integer
# output: return String (Winner or Loser)

# if character code of any of the characters of string (within subarrays) == integer, then is a miniwin
# if total_miniwins >= integer argument then Winner!

def bingo(ticket, minimum)
  miniwins = 0
  ticket.each { |sub| sub[0].each_byte { |e| miniwins += 1 if e == sub[1]}}
  miniwins >= minimum ? 'Winner!' : 'Loser!'
end

p bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 2)
p bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 1)
p bingo([['HGTYRE', 74], ['BE', 66], ['JKTY', 74]], 3)

# best practices option below, for reference

def bingo(tix, win)
  tix.count { |str, int| str.include?(int.chr) } >= win ? 'Winner!' : 'Loser!' 
end

# very clever. example: 65.chr => 'A'
