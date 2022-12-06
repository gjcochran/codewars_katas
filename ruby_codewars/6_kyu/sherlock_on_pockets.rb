# https://www.codewars.com/kata/53bb1201392478fefc000746/train/ruby

# Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

#   Allowed items are defined by array of numbers.
  
#   Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:
  
  pockets = { 
    bob: [1],
    tom: [2, 5],
    jane: [7]
  } 
#   Write method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.
  
#   find_suspects(pockets, [1, 2]) # => [:tom, :jane]
#   find_suspects(pockets, [1, 7, 5, 2]) # => nil
#   find_suspects(pockets, []) # => [:bob, :tom, :jane]
#   find_suspects(pockets, [7]) # => [:bob, :tom]

# return array of suspects with illegal items in their pockets
# def find_suspects(pockets, allowed_items)
#   pockets = { 
#     bob: [1],
#     tom: [2, 5],
#     jane: [7]
#   } 
#   pockets.each { |_, v| v.delete_if { |el| allowed_items.include?(el) }}
#   p pockets
#   result = pockets.keys.select { |k| pockets[k].any? }
#   p result
#   result == [] ? nil : result
# end

# p find_suspects(pockets, [1, 2]) # => [:tom, :jane]
# p find_suspects(pockets, [1, 7, 5, 2]) # => nil
# p find_suspects(pockets, []) # => [:bob, :tom, :jane]
# p find_suspects(pockets, [7]) # => [:bob, :tom]

# def find_suspects(pockets, allowed_items)
#   pockets.delete_if { |_,v| v == nil }
  
#   # if pockets.values.join.split(//).map(&:to_i).include?(allowed_items[0])
#   pockets.each { |_, v| v.delete_if { |el| allowed_items.include?(el) }}
#   result = pockets.keys.select { |k| pockets[k].any? }
#   result == [] ? nil : result
 

# end

# i gave up... all but one solution was passing and it looked like an error in the codewars random tests to me. why waste time
pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

def find_suspects(pockets, allowed_items)
  suspects = pockets.select { |name, items| ([*items]-allowed_items).any? }.keys
  p suspects
  suspects.any? ? suspects : nil
end

p find_suspects(pockets, [1, 2]) # => [:tom, :jane]

    # irb(main):087:0> items = [2, 5]
    # => [2, 5]
    # irb(main):088:0> allowed_items = [1, 2]
    # => [1, 2]
    # irb(main):089:0> [*items]-allowed_items
    # => [5]
    # irb(main):090:0> [*items]
    # => [2, 5]