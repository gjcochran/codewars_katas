# https://www.codewars.com/kata/5453dce502949307cf000bff/train/ruby

# Complete the method that takes a hash/object/directory/association list of users, and find the nexus: the user whose rank is the closest is equal to his honor. Return the rank of this user. For each user, the key is the rank and the value is the honor.

# If nobody has an exact rank/honor match, return the rank of the user who comes closest. If there are several users who come closest, return the one with the lowest rank (numeric value). The hash will not necessarily contain consecutive rank numbers; return the best match from the ranks provided.

# Example
#          rank    honor
# users = {  1  =>  93,
#           10  =>  55,
#           15  =>  30,
#           20  =>  19,    <--- nexus
#           23  =>  11,
#           30  =>   2 }



def nexus(users)
  dif = users.map { |k, v| (k - v).abs }.map.with_index { |el, idx| [el, idx]}

  result = dif[0]
  counter = 1
  loop do
    if result[0] < dif[counter][0]
      result
    elsif result[0] > dif[counter][0]
      result = dif[counter]
    else
      if users.keys[result[1]] < users.keys[dif[counter][1]]
        result
      else
        result = dif[counter]
      end
    end
    counter += 1
    break if counter == dif.size
  end

  users.keys[result[1]]
end

ex1 = {1=>93, 10=>55, 15=>30, 20=>19, 23=>11, 30=>2}
p nexus(ex1)

# wow, looking at codewars my solution was much much too complicated. codewars solution below for reference

# def nexus(users)
#   users.min_by{ |rank, honor| [(rank - honor).abs, rank] }[0]
# end

