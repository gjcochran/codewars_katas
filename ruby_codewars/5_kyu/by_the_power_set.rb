#input: array
# output: array of arrays... all of the subarrays that make up an array
# ex. power([1,2,3]) => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def power(arr)
  result = []  
  0.upto(arr.size) do |i|
    arr.combination(i) { |c| result << c } 
  end
  result
end

p power([1, 2, 3])
p power(%w(a b c))

# review: solution works well. CW ideal solution also used combination but used map and a range rather than upto
# (0..arr.size).flat_map { |i| arr.combination(i).to_a }
