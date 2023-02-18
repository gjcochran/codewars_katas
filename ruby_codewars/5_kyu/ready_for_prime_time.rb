require 'prime'

def prime(n)
  return [] if n <= 1
  (2..n).select { |e| e.prime? }
end

p prime(23)
