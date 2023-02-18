def validPhoneNumber(str)
  str.match?(/^\(\d{3}\) \d{3}\-\d{4}$/)
end

p validPhoneNumber("(123) 456-7890")
