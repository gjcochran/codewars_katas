def shifted_diff(first, second)
  arr = first.chars
  result = -1
  counter = 0

  loop do
    temp = arr.rotate(counter)
    if temp.join == second
      result = counter.abs
      break
    end
    counter -= 1
    break if counter.abs > arr.size
  end

  result  
end

p shifted_diff("coffee", "eecoff")

# works, couldve done with each, cwars answer for ref written below
# `(0..second.size).each { |n| return n if first == second.chars.rotate(n).join }
#  -1
#  `
