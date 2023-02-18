# input: 2 positive integers
# output: integer ... last decimal digit of a**b

def last_digit(a, b)
  return 1 if b.zero?
  rules = {
    0 => [0, 0, 0, 0],
    1 => [1, 1, 1, 1],
    2 => [6, 2, 4, 8],
    3 => [1, 3, 9, 7],
    4 => [6, 4, 6, 4],
    5 => [5, 5, 5, 5],
    6 => [6, 6, 6, 6],
    7 => [1, 7, 9, 3],
    8 => [6, 8, 4, 2],
    9 => [1, 9, 1, 9]
  }
  
  num1 = a.to_s.chars.last.to_i
  num2 = b.divmod(4).last
  rules[num1][num2]
end

#p last_digit(4, 1)
#p last_digit(4, 2)
#p last_digit(9, 7)
#p last_digit(10, 10 ** 10)
p last_digit(2 ** 200, 2 ** 300)
#p last_digit(3715290469715693021198967285016729344580685479654510946723, 68819615221552997273737174557165657483427362207517952651)

# review: solved but took me a long time to figure out and hash was inefficient...
# could simply have written... a.pow(b, 10) -- this signifies (a**b) % 10
