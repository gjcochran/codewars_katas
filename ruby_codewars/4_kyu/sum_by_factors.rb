# steps: 
#   find all factors of each input el which are prime nums
#   the ones that the input els have in common are then summed ( the inputs are summed not the factor)
#     ex input: [12, 15]
#     the prime factors of 12 are 2 and 3
#     the prime factors of 15 are 3 and 5
#     therefore [[2, 12], [3, 27], [5, 15]] is the return value
require 'prime'

def sumOfDivided(lst)
  factors = {} 
  lst.each do |n|
    2.upto(n.abs) do |i|
      if i.prime?
        if factors[i].nil? && n % i == 0
          factors[i] = n
        elsif n % i == 0
          factors[i] += n
        end
      else
        next
      end
    end
  end 
  factors.to_a
end

p sumOfDivided([12, 15])
