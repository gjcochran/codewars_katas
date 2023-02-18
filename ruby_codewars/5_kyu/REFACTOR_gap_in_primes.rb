require 'prime'

def gap(g, m, n)
  primes = (m..n).select { |num| num.prime? && (num+g).prime? && (num+1...num+g).select(&:prime?).empty? }
  primes.empty? ? nil : [primes.first, primes.first + g]
end

p gap(2, 100, 110)
p gap(4, 100, 110)
p gap(6, 100, 110)

# too slow, the below is slightly quicker, but still too slow...
#
#  def gap(g, m, n)
   primes = (m..n).select { |num| num.prime? }
   
   primes = primes.select.with_index { |x, y| primes[y+1]-x==g unless primes[y+1].nil?}
   primes.empty? ? nil : [primes.first, primes.first + g]
 end
