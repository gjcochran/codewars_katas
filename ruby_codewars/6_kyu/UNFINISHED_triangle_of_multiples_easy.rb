def mult_triangle_v1(n)
  results = [1]
  2.upto(n) do |i|
    i.upto(i**2) do |num|
      results << num << num if num % i == 0
    end
    results.pop
  end
  odds = results.select { |el| el.odd? }
  evens = results.select { |el| el.even? }
  [results.sum, evens.sum, odds.sum]
end

# v1 works great but apparently too slow to pass all cw tests....

def mult_triangle(n)
  results = [1]
  2.upto(n) do |i|
    
  end
end


p mult_triangle(5)

