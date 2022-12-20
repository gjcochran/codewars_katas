# https://www.codewars.com/kata/51b62bf6a9c58071c600001b/train/ruby
# Create a function taking a positive integer as its parameter and returning a string containing the Roman Numeral representation of that integer.

# Modern Roman numerals are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero. In Roman numerals 1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC. 2008 is written as 2000=MM, 8=VIII; or MMVIII. 1666 uses each Roman symbol in descending order: MDCLXVI.

# Example:

# solution(1000) # should return 'M'
# Help:

# Symbol    Value
# I          1
# V          5
# X          10
# L          50
# C          100
# D          500
# M          1,000
# Remember that there can't be more than 3 identical symbols in a row.

# D/A


def solution(input)
  num = input
  result = []
  loop do
    case
    when num >= 1000
      arr = num.divmod(1000)
      result << 'M' * arr[0]
      num = arr[1]
    when num >= 900 && num < 1000
      arr = num.divmod(900)
      result << 'CM' * arr[0]
      num = arr[1]
    when num >= 500 && num < 900
      arr = num.divmod(500)
      result << 'D' * arr[0]
      num = arr[1]
    when num >= 400 && num < 500
      arr = num.divmod(400)
      result << 'CD' * arr[0]
      num = arr[1]
    when num >= 100 && num < 400
      arr = num.divmod(100)
      result << 'C' * arr[0]
      num = arr[1]
    when num >= 90 && num < 100
      arr = num.divmod(90)
      result << 'XC' * arr[0]
      num = arr[1]
    when num >= 50 && num < 90
      arr = num.divmod(50)
      result << 'L' * arr[0]
      num = arr[1]
    when num >= 40 && num < 50
      arr = num.divmod(40)
      result << 'XL' * arr[0]
      num = arr[1]
    when num >= 10 && num < 40
      arr = num.divmod(10)
      result << 'X' * arr[0]
      num = arr[1]
    when num >= 9 && num < 10
      arr = num.divmod(9)
      result << 'IX' * arr[0]
      num = arr[1]
    when num >= 5 && num < 9
      arr = num.divmod(5)
      result << 'V' * arr[0]
      num = arr[1]
    when num >= 4 && num < 5
      arr = num.divmod(4)
      result << 'IV' * arr[0]
      num = arr[1]
    else
      arr = num.divmod(1)
      result << 'I' * arr[0]
      break
    end
  end
  result.join
end


# p solution(1) #'I', "solution(1),'I'")
# p solution(4) #'IV', "solution(4),'IV'")
# p solution(6) #'VI', "solution(6),'VI'")
# p solution(14) #'XIV', "solution(14),'XIV")
# p solution(21) #'XXI', "solution(21),'XXI'")
# p solution(89) #'LXXXIX', "solution(89),'LXXXIX'")
# p solution(91) #'XCI', "solution(91),'XCI'")
# p solution(984) #'CMLXXXIV', "solution(984),'CMLXXXIV'")
# p solution(1000) # 'M', 'solution(1000), M')
p solution(1889) #'MDCCCLXXXIX', "solution(1889),'MDCCCLXXXIX'")
p solution(1989) #'MCMLXXXIX', "solution(1989),'MCMLXXXIX'")

# recursive codewars answer below which is wayyyy simpler
NUMERALS = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90,
  L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }

def solution_CW(number)
return '' if number <= 0
NUMERALS.each { |key, val| return key.to_s + solution_CW(number - val) if number >= val }
end

