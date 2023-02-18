def last_digit(arr)
  working = arr.clone
  num1 = working.shift
  num1.pow((working.reduce(:*)), 10)
end

p last_digit([3, 4, 2])
p last_digit([123232, 694022, 140249])
