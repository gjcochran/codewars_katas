# levels scale by n**level
# ex. 
#   level 1 - 1
#   level 2 - 4
#   level 3 - 9 etc..
# bonus / price = number of beer cans
#   l1 - 1-4 cans 
#   l2 - 5-13 cans
#   l3 - 14-29 cans etc..

def beeramid(bonus, price)
  cans = bonus / price
  
  level = 1
  total = []
  loop do
    0.upto(level) { |n| total << (n ** 2) }
    break if total.sum > cans
    level += 1; total.clear 
  end
  level - 1
end

p beeramid(9, 2)
p beeramid(1500, 2)
