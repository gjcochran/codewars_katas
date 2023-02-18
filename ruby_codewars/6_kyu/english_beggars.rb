def beggars(values, n)
  arr = values.clone
  result = []
  n.downto(2) do |q|
    temp = []
    arr.each_index do |i| 
      if (i + 1) % q == 0
        temp << arr[i] 
        arr[i] = nil
      end
    end
    result << temp
    arr.compact!
  end
  result << arr
  result.reverse!
  result.map(&:sum)
end

p beggars([1,2,3,4,5], 3)
p beggars([1,2,3,4,5], 2)

# don|t love my solution as requires deleting thru a copy of the input array
# cwars example that is quite clever...
# `sums = Array.new(n, 0) # this will create an array length n with every value starting = 0
#  values.each_with_index do |v, i|
#    sums[i % n] += v
#  end
#  sums`
