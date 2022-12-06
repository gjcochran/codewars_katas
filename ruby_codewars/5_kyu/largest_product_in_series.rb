# https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby

# Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

# For example:

# greatestProduct("123834539327238239583") // should return 3240
# The input string always has more than five digits.

def greatest_product(n)
  products = []
  arr = n.chars
  counter = 0
  loop do 
    product = arr[counter].to_i * arr[counter+1].to_i * arr[counter+2].to_i * arr[counter+3].to_i * arr[counter+4].to_i
    products << product
    counter += 1
    break if counter == arr.size-4
  end
  products.max
end

p greatest_product("123834539327238239583")

# codewars answer used a method each_cons that ive never seen before
# def greatest_product(n)
#   n.chars.each_cons(5).map { |a| a.map(&:to_i).reduce(:*) }.max
# end
# https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-each_cons