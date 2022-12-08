# https://www.codewars.com/kata/52a112d9488f506ae7000b95/train/ruby

# returns true  / True if every element in an array is an integer or a float with no decimals.
# returns true  / True if array is empty.
# returns false / False for every other input.

  # irb(main):003:0> 12.is_a?(Integer)
  # => true
  # irb(main):004:0> 12.is_a?(String)
  # => false

def is_int_array(arr)
  if arr.is_a?(Array)
    arr.select { |el| el.is_a?(Integer) || el.is_a?(Float) && el.to_s.end_with?('.0')}.size == arr.size
  else
    false
  end
end




p is_int_array([]) # true, "Input: []")
p is_int_array([1, 2, 3, 4]) # true, "Input: [1, 2, 3, 4]")
p is_int_array([-11, -12, -13, -14]) # true, "Input: [-11, -12, -13, -14]")
p is_int_array([1.0, 2.0, 3.0]) # true, "Input: [1.0, 2.0, 3.0]")
p is_int_array([1, 2, nil]) # false, "Input: [1,2, nil]")
p is_int_array(nil) #false, "Input: nil")
p is_int_array("") # false, "Input: ''")
p is_int_array([nil]) # false, "Input: [nil]")
p is_int_array([1.0, 2.0, 3.0001]) # false, "Input: [1.0, 2.0, 3.0001]")
p is_int_array(["-1"]) # false, "Input: ['-1']")


# several codewars answers below to compare to

# def is_int_array(arr)
#   arr.is_a?(Array) && arr.all? { |x| x.is_a?(Integer) || x.is_a?(Float) && x.to_i == x }
# end

# def is_int_array(arr)
#   return false unless arr.is_a? Array
 
#    arr.all? do |num| 
#      num.to_i == num 
#    end 
#  end
