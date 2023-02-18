# reduce denominator to smallest prime number
# reduce numerator by same amount
# num.divmod(den)

require 'prime'

def mixed_fraction(s)
  x, y = s.split('/').map(&:to_i)
  # test for zero division error
  x / y
  return '0' if x.zero?
  # test if inputs divide to whole number
  fraction_check = (x.to_f / y).to_s
  return (x/y).to_s if fraction_check.match?(/\d+\.0/)
  
  # test if either input is negative
  if (x < 0 && y > 0) || (x > 0 && y < 0) 
    neg = true
  else
    neg = false
  end

  abs_x = x.abs
  abs_y = y.abs

  new_y = 3
  loop do
    unless new_y.prime?
      new_y += 1
      next
    end

    if abs_y.prime?
      new_y = abs_y 
    end
    if abs_y % new_y == 0
      break
    else
      new_y += 1
    end
  end
  
  reduction = abs_y.divmod(new_y).first
  new_x = abs_x / reduction

  whole_calc = new_x.divmod(new_y) 

  whole_calc.first.zero? ? (result = "#{whole_calc.last}/#{new_y}") : (result = "#{whole_calc.first} #{whole_calc.last}/#{new_y}")
  neg == true ? result.insert(0, '-') : result
end

p mixed_fraction('42/9')
p mixed_fraction('6/3')
p mixed_fraction('4/6')
p mixed_fraction('4/-6')
p mixed_fraction('0/18891')
p mixed_fraction('-10/7')
p mixed_fraction('10/-7')
p mixed_fraction('-22/-7')
p mixed_fraction('0/0')
p mixed_fraction('3/0')

# doesn|t work. modulo prime numbers is not specific enough
# examp:le...
# input: "589275/971470" should return "117855/194294"
