# https://www.codewars.com/kata/5b715fd11db5ce5912000019/train/ruby

# Ronny the robot is watching someone perform the Cups and Balls magic trick. The magician has one ball and three cups, he shows Ronny which cup he hides the ball under (b), he then mixes all the cups around by performing multiple two-cup switches (arr). Ronny can record the switches but can't work out where the ball is. Write a programme to help him do this.

# Rules:

# There will only ever be three cups.
# Only two cups will be swapped at a time.
# The cups and their switches will be refered to by their index in a row of three, beginning at one. So [[1,2]] means the cup at position one, is swapped with the cup at position two.
# Arr will be an array of integers 1 - 3 organised in pairs.
# There won't be any empty sub-arrays.
# If arr is just an empty array b should be returned.
# Examples:

# (b) = 2, (arr) = [[1,2]]

# The ball is under cup number : 1

# (b) = 1, (arr) = [[2,3],[1,2],[1,2]]

# The ball is under cup number : 1

# (b) = 2, (arr) = [[1,3],[1,2],[2,1],[2,3]]

# The ball is under cup number : 3

def cup_and_balls(b, arr)
  location = b
  test = arr
  test.each do |sub| 
    if sub.include?(location)
      sub.delete(location)
      location = sub.first
    end
  end
  
  location
end

p cup_and_balls(2,[[1,2]]) # 1)
p cup_and_balls(1,[[2,3],[1,2],[1,2]]) # 1)
p cup_and_balls(2,[[1,3],[1,2],[2,1],[2,3]]) # 3)
p cup_and_balls(3, [[1, 2], [1, 2], [1, 3], [3, 2], [3, 2], [1, 3]])
p cup_and_balls(3, [[3, 1], [3, 2], [2, 1], [2, 3], [3, 1], [2, 1]])

# i must not understand this prompt because the last two im returning 3 and 2 respectively, and this challenge in codewars says that instead should return nil and 3... not gonna waste any more time