# https://www.codewars.com/kata/54da539698b8a2ad76000228/train/ruby

# You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block for each letter (direction) and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.

# Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty array (that's not a walk, that's standing still!).

# P
# want to start and end in the same place
# each direction (n, s, e, w) equals one city block equals one minute
# want walk to take exactly 10 mins

# D/A
# could have two axes in array
# ie X = east/west; Y = north/south [east/west, north/south]
# n = 1, w = 1; s = -1; e = -1
# start at [0,0] and after 10 directions need to end at [0,0]
# input array of directions .size must equal 10

def is_valid_walk(walk)
  if walk.size == 10
    coords = [0, 0]
    walk.each do |el|
      case
      when el == 'n' then coords[1] += 1
      when el == 's' then coords[1] -= 1
      when el == 'w' then coords[0] += 1
      when el == 'e' then coords[0] -= 1
      end
    end
    coords == [0, 0]
  else
    false
  end
end


p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) #true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e'])#false
p is_valid_walk(['w']) #false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) #false
 
# codewars answer quite simple, pasted below for reference...

def isValidWalk(walk)
  walk.count('n') == walk.count('s') && walk.count('e') == walk.count('w') && walk.count == 10
end

