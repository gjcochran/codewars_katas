def palindrome(string)
  simple = string.scan(/\w/).join.downcase
  simple == simple.reverse
end
