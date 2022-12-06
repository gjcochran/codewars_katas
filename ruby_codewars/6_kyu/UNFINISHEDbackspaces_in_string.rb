# https://www.codewars.com/kata/5727bb0fe81185ae62000ae3/train/ruby

# Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

# Your task is to process a string with "#" symbols.

# Examples
# "abc#d##c"      ==>  "ac"
# "abc##d######"  ==>  ""
# "#######"       ==>  ""
# ""              ==>  ""

# first tests

  # irb(main):021:0> arr = str.chars
  # => ["a", "b", "c", "#", "d", "#", "#", "c"]
  # irb(main):022:0> arr.delete_if.with_index { |el, idx| el  == '#' || arr[idx+1] == '#' }
  # => ["a", "b", "c"]

  # not really what i want, want to delete the previous letter if there is a '#', regardless of how far back in arr that letter is 

def clean_string(str)
  arr = str.chars
  arr.each_with_index do |el, idx| 
    if arr[idx] == '#' 
      arr.delete_at(idx-1) &&
      arr.delete_at(idx) 
    end
  end
  arr.join
end

  p clean_string("abc#d##c")
  p clean_string("ab##c")