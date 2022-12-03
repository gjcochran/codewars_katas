# https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0

# PROBLEM:
# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

# solve(["abode","ABc","xyzD"]) = [4, 3, 1]
# See test cases for more examples.

# Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def solve(arr)
  test_arr = arr.map { |word| word.downcase.chars }
  
  solution = test_arr.map do |sub_arr|
    results = []
    sub_arr.each_index do |index|
      results << sub_arr[index] if sub_arr[index] == ALPHABET[index]
    end
    results.size
  end
  solution
end


# TESTS

p solve(["abode","ABc","xyzD"])
p solve(["abide","ABc","xyz"])
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])
p solve(["encode","abc","xyzD","ABmD"])

# all tests worked. clever codewars alternative solution pasted below for reference. 
# def solve(strings)
#   strings.map{ |s| s.downcase.each_char.zip('a'..'z').count{ |a, b| a == b } }
# end

# irb(main):007:0> a = ('a'..'z').zip
# => [["a"], ["b"], ["c"], ["d"], ["e"], ["f"], ["g"], ["h"], ["i"], ["j"], ["k"], ["l"], ["m"], ["n"], ["o"], ["p"], ["q"...
