# https://www.codewars.com/kata/550f22f4d758534c1100025a

# In ["NORTH", "SOUTH", "EAST", "WEST"], the direction "NORTH" + "SOUTH" is going north and coming back right away.

# The path becomes ["EAST", "WEST"], now "EAST" and "WEST" annihilate each other, therefore, the final result is [] (nil in Clojure).

# In ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"], "NORTH" and "SOUTH" are not directly opposite but they become directly opposite after the reduction of "EAST" and "WEST" so the whole path is reducible to ["WEST", "WEST"].

# Task
# Write a function dirReduc which will take an array of strings and returns an array of strings with the needless directions removed (W<->E or S<->N side by side).

# Not all paths can be made simpler. The path ["NORTH", "WEST", "SOUTH", "EAST"] is not reducible. "NORTH" and "WEST", "WEST" and "SOUTH", "SOUTH" and "EAST" are not directly opposite of each other and can't become such. Hence the result path is itself : ["NORTH", "WEST", "SOUTH", "EAST"].

def dirReduc(arr)
  idx = 0
  
  loop do
    case 
    when arr[idx] == 'NORTH' && arr[idx+1] == 'SOUTH' 
      arr.delete_at(idx+1) && arr.delete_at(idx)
      idx -= 1 unless idx == 0
    when arr[idx] == 'SOUTH' && arr[idx+1] == 'NORTH'
      arr.delete_at(idx+1) && arr.delete_at(idx)
      idx -= 1 unless idx == 0
    when arr[idx] == 'EAST' && arr[idx+1] == 'WEST'
      arr.delete_at(idx+1) && arr.delete_at(idx)
      idx -= 1 unless idx == 0
    when arr[idx] == 'WEST' && arr[idx+1] == 'EAST'
      arr.delete_at(idx+1) && arr.delete_at(idx)
      idx -= 1 unless idx == 0
    else
      idx += 1
    end
    break if idx == arr.size
  end

  arr
end

a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
p dirReduc(a) #=> ["WEST"])
u = ["NORTH", "WEST", "SOUTH", "EAST"]
p dirReduc(u) #=> ["NORTH", "WEST", "SOUTH", "EAST"])


# Codewars answer below

# OPPOSITE = {
#   "NORTH" => "SOUTH",
#   "SOUTH" => "NORTH",
#   "EAST"  => "WEST",
#   "WEST"  => "EAST"
# }

# def dirReduc(arr)
#   stack = []
#   arr.each do |dir|
#     OPPOSITE[dir] == stack.last ? stack.pop : stack.push(dir)
#   end
#   stack
# end