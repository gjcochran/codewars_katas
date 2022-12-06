# https://www.codewars.com/kata/515de9ae9dcfc28eb6000001/train/ruby

# Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

# Examples:

# * 'abc' =>  ['ab', 'c_']
# * 'abcdef' => ['ab', 'cd', 'ef']

def solution(str)
  if str.empty?
    []
  else
    str.size.odd? ? str << '_' : str
    # arr = (0..str.size-1).to_a
    counter = 0
    result = []
    loop do
      result << str[counter..(counter+1)]
      counter += 2
      break if counter == str.size
    end
    result
  end
end

p solution('abc')
p solution('abcdef')

# worked but a real pain and inefficent.. after reviewing codewars much easier to use scan method w regex

  # irb(main):023:0> 'abcdef'.scan /../
  # => ["ab", "cd", "ef"]
  # irb(main):024:0> 'abcdef_'.scan /../
  # => ["ab", "cd", "ef"]

  # def solution str
  #   (str + '_').scan /../
  # end
