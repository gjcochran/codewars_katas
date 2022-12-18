# https://www.codewars.com/kata/62c93765cef6f10030dfa92b/train/ruby
# An infinite number of shelves are arranged one above the other in a staggered fashion.
# The cat can jump up to 3 shelves at the same time: from shelf 1 to shelf 2 or 4 (the cat cannot climb on the shelf directly above its head)

# Input
# Start and finish shelf numbers (always positive integers, finish no smaller than start)

# task
# Find the minimum number of jumps to go from start to finish

# Example
# Start 1, finish 5, then answer is 2 (1 => 4 => 5 or 1 => 2 => 5)

def jumps(start, finish)
  return 0 if start == finish
  count = 0
  shelf = start
  loop do
    if shelf + 3 == finish
      count += 1 
      break
    elsif shelf + 2 == finish
      count += 1
      shelf += 1
    elsif shelf + 1 == finish
      count += 1
      break
    else
      shelf += 3
      count += 1
    end
  end
  count
end

p jumps(1, 2) # 1
p jumps(1, 3) # 2
p jumps(1, 4) # 1
p jumps(1, 5) # 2
p jumps(3, 3) # 0

# codewars answer
# def jumps(start, finish)
#   (finish - start).divmod(3).sum
# end