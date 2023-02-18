def validISBN10(isbn)
  arr = isbn.chars
  arr = arr.select.with_index { |n, i| i < 9 ? n =~ /[1234567890]/ : n =~ /[1234567890X]/ }
  return false if arr.size != 10
  nums = arr.map { |e| e == 'X' ? 10 : e.to_i }
  nums_sums = nums.map.with_index { |e, i| e*(i+1) }
  sum = nums_sums.sum
  sum % 11 == 0 ? true : false
end

p validISBN10('1112223339')
p validISBN10('048665088X')
p validISBN10('1234512345')
