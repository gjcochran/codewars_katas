def next_num(max_num)
  m = max_num
  c = 1
  loop do
    break if c ** 2 > m
    c += 1
  end
  c - 1
end

def decompose(n)
  goal = n ** 2
  result = [n-1]
  dif = goal - ((n-1)**2) 
  counter = 1
  loop do
    i = next_num(dif)
    result.unshift(i)
    temp = result.map { |i| i ** 2 }.sum
    break if temp == goal
    p i, result, dif
    dif = goal - temp
    p dif
    counter += 1
    break if counter == 6
  end
  result == result.uniq ? result : nil
end

p decompose(11)
p decompose(4)
p decompose(50)
