# https://www.codewars.com/kata/5491689aff74b9b292000334/train/ruby

# For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times.

# The input string consists of lowercase latin letters.

# Your function should return :

# an array [t, k] 

# Example #1:

# for string

# s = "ababab";
# the answer is
# ("ab", 3)

# Example #2:

# for string
# s = "abcde"
# the answer is
# ("abcde", 1)
# because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

# D/A
# can use scan method and then compare the returned array elements to each other, when they are equal, stop, otherwise return the last option 
#   irb(main):023:0> s
#   => "abcde"
#   irb(main):024:0> s.scan(/.{1,1}/)
#   => ["a", "b", "c", "d", "e"]
#   irb(main):025:0> s.scan(/.{1,2}/)
#   => ["ab", "cd", "e"]
#   irb(main):026:0> s.scan(/.{1,3}/)
#   => ["abc", "de"]
#   irb(main):027:0> s.scan(/.{1,4}/)
#   => ["abcd", "e"]
#   irb(main):028:0> s.scan(/.{1,5}/)
#   => ["abcde"]

def repeated(string)
  counter = 1
  result = 0
  substring = ""
  loop do
    arr = string.scan(/.{1,#{counter}}/)
    counter += 1
    if arr[0] == arr[1] || counter > string.size
      substring += arr[0]
      result += arr[0].size
      break
    end
  end
  [substring, string.size / result]
end

p repeated("ababab")
p repeated("abababab")
p repeated("abcde")


# mine worked but was not simple. more straightforward approach from codewars pasted below for reference

def repeated_v2(str)
  (1..str.size).each do |substr_size|
    substr = str[0, substr_size]
    repetitions = str.size / substr_size
    
    return [substr, repetitions] if substr * repetitions == str
  end
end

p repeated_v2("ababab")

    # irb(main):041:0> str = "ababab"
    # => "ababab"
    # irb(main):042:0> substr = str[0, 1]
    # => "a"
    # irb(main):043:0> substr = str[0, 2]
    # => "ab"
    # irb(main):044:0> substr = str[0, 3]
    # => "aba"
    # etc.....

    # irb(main):047:0> substr = str[0, 2]
    # => "ab"
    # irb(main):048:0> repetitions = str.size / substr.size
    # => 3
    # irb(main):049:0> substr * repetitions
    # => "ababab"