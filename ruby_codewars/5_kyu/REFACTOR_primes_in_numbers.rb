require 'prime'

def prime_factors(n)
  working = n 
  list = []

  counter = 2

  loop do
    unless counter.prime?
      counter += 1
      next
    end
    temp = working.divmod(counter) 

    if temp[0].prime? && temp[1].zero? 
      list << temp[0]
      list << list[-2]
      break
    elsif temp[1].zero?
      list << counter
      working = temp[0]
      counter = 2
    else
      counter += 1 
    end
  end

  list = list.map { |el| list.count(el) > 1 ? [el, list.count(el)] : [el] }.uniq
  list.map { |sub| sub.size > 1 ? "(#{sub[0]}**#{sub[1]})" : "(#{sub[0]})"}.join
end

p prime_factors(86240)
p prime_factors(7775460)
p prime_factors(7919)

# works with two given examples but server times out during tests, specifically with n = 7919
