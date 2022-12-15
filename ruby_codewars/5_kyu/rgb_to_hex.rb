# https://www.codewars.com/kata/513e08acc600c94f01000001

# The rgb function is incomplete. Complete it so that passing in RGB decimal values will result in a hexadecimal representation being returned. Valid decimal values for RGB are 0 - 255. Any values that fall out of that range must be rounded to the closest valid value.

# Note: Your answer should always be 6 characters long, the shorthand with 3 will not work here.

# The following are examples of expected output values:

# rgb(255, 255, 255) # returns FFFFFF
# rgb(255, 255, 300) # returns FFFFFF
# rgb(0,0,0) # returns 000000
# rgb(148, 0, 211) # returns 9400D3

# 0-9 A=10, B=11, C=12, D=13, E=14, F=15

# hexa  dec 
# 10    16
# 20    32
# 80    128

# D/A
# use divmod and always divide by 16

HEX = %w(0 1 2 3 4 5 6 7 8 9 A B C D E F)

def rgb_method(r, g, b)
  result = []
  result << hex_conversion(r)
  result << hex_conversion(g)
  result << hex_conversion(b)
  result.join
end

def hex_conversion(arg)
  if arg > 255
    arg = 255
  elsif arg < 0
    arg = 0
  else
    arg
  end
  color = arg.divmod(16)
  color.map { |el| HEX[el] }
end

p rgb_method(0, 0, 0) # '000000')
p rgb_method(0, 0, -20) # '000000')
p rgb_method(300,255,255) # 'FFFFFF')
p rgb_method(173,255,47) # 'ADFF2F')

# codewars answers below
# can convert a number to base 16 after to_s method
# irb(main):008:0> 255.to_s(16)
# => "ff"

# def rgb(r, g, b)
#   "%.2X%.2X%.2X" % [r,g,b].map{|i| [[i,255].min,0].max}
# end

# explanation
# def rgb2(r, g, b)
#   #map to a new array
#   #take number, compare it with 255, get the min value
#   ###if number is more than 255, 255 will be returned
#   ###if number is less than 255, the number will be returned
#   #take number, compare it to 0
#   ###if number is more than 0, the number will be returned
#   ###if number is less than 0, 0 will be returned
  
#   array = [r, g, b].map { |i| [[i, 255].min, 0].max }
  
#   #you now have an array of valid numbers e.g [16, 16, 16]
#   #create a template string and apply it to the array with % (called format_string in ruby docs %[flags][width][.precision]type)
#   #template string location corresponds to array location ie template[0] => array[0]
#   #%.2X does two things. .2x is converting the corresponding number in the array to hexidecimal with a precision of 2 digits
#   #the % is placing it in that spot in the template string
#   #the template string filled with the elements is returned
  
#   '%.2X%.2X%.2X' % array
  
#   # in one line:
#   # '%.2X%.2X%.2X' % [r, g, b].map { |i| [[i, 255].min, 0].max }
# end

# def rgb(r, g, b)
#   [r, g, b].map do |c|
#     if c <= 0 
#       "00"
#     elsif c > 255
#       "FF"
#     else
#       c.to_s(16).upcase    
#     end
#   end.join('')
# end
