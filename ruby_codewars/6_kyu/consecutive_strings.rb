# input:
# array of strings && integer
# output: 
# first longest string of all concatenated (by integer input)
# consecutive strings

def longest_concat(arr, k)
  stopper = arr.size - k
  results = []

  0.upto(stopper) do |i|
    results << arr[i..i+(k-1)].join
  end

  longest = results.map(&:size).max
  results.select { |str| str.size == longest }.first
end

array_test = ["tree", "foling", "trashy", "blue", "abcdef", "uvwxyz"]
p longest_concat(array_test, 2)

# best solution from cwars below:
# return '' unless k.between?(1, strarr.length)
# strarr.each_cons(k).map(&:join).max_by(&:length) || ''
