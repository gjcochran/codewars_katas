# https://www.codewars.com/kata/5a7f58c00025e917f30000f1

# Find the longest substring in alphabetical order.

# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

# There are tests with strings up to 10 000 characters long so your code will need to be efficient.

# The input will only consist of lowercase characters and will be at least one letter long.

# If there are multiple solutions, return the one that appears first.

# D/A

# 'b' >= 'a' # true
# 'a' >= 'a' # true
# 'a' >= 'b' # false

# would like to make subarrays iterating through the string.chars & creating a new subarray everytime char >= char2 returns false

def longest(s)
  result = []
  arr = s.chars
  
  counter = 0
  a = []
  if arr.size > 1
    loop do
      if arr[counter] <= arr[counter+1] && a.empty?
        a << arr[counter]
        a << arr[counter+1]
      
      elsif arr[counter] <= arr[counter+1]
        a << arr[counter+1]
        
      else
        result << [arr[counter]]
        result << a
        a = []
        
      end
      counter += 1
      if counter == arr.size - 1
        result << a 
        break
      end
    end
    p result
    result.reverse!.sort_by!(&:size)
    
    result.last.join
  else
    s
  end
end

p longest('asd') # 'as')
p longest('nab') # 'ab')
p longest('abcdeapbcdef') # 'abcde')
p longest('asdfaaaabbbbcttavvfffffdf') # 'aaaabbbbctt')
p longest('asdfbyfgiklag') # 'fgikl')
p longest('z') # 'z')
p longest('zyba') # 'z')

# wow mine worked but took me 45 mins to come up with and was extremely inefficient... codewars efficient answer below...

def longest_BP(str)
  str.chars.slice_when { |a, b| a > b }
           .max_by(&:size)
           .join
end
