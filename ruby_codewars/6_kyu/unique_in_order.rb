# https://www.codewars.com/kata/54e6533c92449cc251001667/train/ruby

# Implement the function unique_in_order which takes as argument a sequence and returns a list of items without any elements with the same value next to each other and preserving the original order of elements.

# For example:

# unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
# unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
# unique_in_order([1,2,2,3,3])       == [1,2,3]

def unique_in_order(input)
  input.is_a?(String) ? arr = input.chars : arr = input.map(&:to_s)
  result = []
  hold = []
  arr.each_with_index do |el, idx|
    if idx == 0 
      hold << el
    elsif el == arr[idx-1]
      hold << el
    elsif el != arr[idx-1]
      result << hold
      hold = []
      hold << el
    end
  end
  result << hold
  if input.is_a?(String)
    result.map(&:uniq).flatten
  else
    int_test = input.select { |el| el.is_a?(Integer) } 
    int_test.empty? ? result.map(&:uniq).flatten : result.map(&:uniq).flatten.map(&:to_i)
  end
end

p unique_in_order('AAAABBBCCDAABBB') #== ['A', 'B', 'C', 'D', 'A', 'B']
p unique_in_order('ABBCcAD')         #== ['A', 'B', 'C', 'c', 'A', 'D']
p unique_in_order([1,2,2,3,3])       #== [1,2,3]

# codewars answer # used the chunk method
# def unique_in_order(iterable)
#   (iterable.is_a?(String) ? iterable.chars : iterable).chunk { |x| x }.map(&:first)
# end