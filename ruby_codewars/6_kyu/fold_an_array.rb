def fold_array(arr, n)
  f = arr
  n.times do 
    if f.size.even?
      mid = f.size / 2
      b = f.slice!(mid, mid).reverse
      f = f.map.with_index { |n,i| n + b[i]}
    else
      mid = f.size / 2 + 1
      b = f.slice!(mid, mid-1).reverse
      b.push(0)
      f = f.map.with_index { |n,i| n + b[i]}
    end
  end
  f
end

p fold_array([1, 2, 3, 4, 5], 1)
p fold_array([1, 2, 3, 4, 5], 2)
