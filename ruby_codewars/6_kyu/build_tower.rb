# https://www.codewars.com/kata/576757b1df89ecf5bd00073b/train/ruby

# Build a pyramid-shaped tower, as an array/list of strings, given a positive integer number of floors. A tower block is represented with "*" character.

# For example, a tower with 3 floors looks like this:

# [
#   "  *  ",
#   " *** ", 
#   "*****"
# ]
# And a tower with 6 floors looks like this:

# [
#   "     *     ", 1
#   "    ***    ", 3
#   "   *****   ", 5
#   "  *******  ", 7
#   " ********* ", 9
#   "***********"  11
# ]

def towerBuilder(n)
  base = n * 2 - 1
  space = n - 1
  counter = 1
  result = []
  loop do
    result
    result << ' ' * space + '*' * counter + ' ' * space
    space -=1
    counter += 2
    break if counter > base
  end
  result
end

p towerBuilder(3)
p towerBuilder(6)

# codewars answer bellow
# def towerBuilder(n)
#   (1..n).map do |i|
#     space = ' ' * (n - i)
#     stars = '*' * (i * 2 - 1)
#     space + stars + space
#   end
# end