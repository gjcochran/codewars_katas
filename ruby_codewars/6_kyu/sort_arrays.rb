# https://www.codewars.com/kata/51f41fe7e8f176e70d0002b9/train/ruby

# Sort the given array of strings in alphabetical order, case insensitive. For example:

#   ["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
#   ["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]

    # irb(main):005:0> ["C", "d", "a", "B"].map(&:downcase).sort
    # => ["a", "b", "c", "d"]

def sortme(strings)
  hsh = strings.each_with_object ({}) { |el, h| h[el] = el.downcase }
  # arr = strings.map(&:downcase).sort
  # arr.map { |el| hsh.key(el) }
  strings.map(&:downcase).sort.map { |el| hsh.key(el) }
end

p sortme(["Hello", "there", "I'm", "fine"]) #=> ["fine", "Hello", "I'm", "there"])
p sortme(["C", "d", "a", "B"]) #=> ["a", "B", "C", "d"])
p sortme(["CodeWars"]) #=> ["CodeWars"])

# codwars below... !!!! sort_by method makes this so simple!
def sortme_bp( names )
  names.sort_by(&:downcase)
end

p sortme_bp(["Hello", "there", "I'm", "fine"]) #=> ["fine", "Hello", "I'm", "there"])
p sortme_bp(["C", "d", "a", "B"]) #=> ["a", "B", "C", "d"])
p sortme_bp(["CodeWars"]) #=> ["CodeWars"])