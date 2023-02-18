def movingShift(str, shift)
  alphabet = {}
  letters = ('a'..'z').to_a
  (1..26).each_with_object({}) { |el, h| alphabet[el] = letters[el-1] }
  a = str.scan(/[\w\W]/)

  counter = shift
  idx = 0
  result_arr = []
  loop do
    e = a[idx]
    if e =~ /[a-z]/ 
      sh = (alphabet.key(e) + counter).divmod(26)[1]
      sh = 26 if sh.zero?
      result_arr << alphabet[sh] 
    elsif e =~ /[A-Z]/
      sh = (alphabet.key(e.downcase) + counter).divmod(26)[1]
      sh = 26 if sh.zero?
      result_arr << alphabet[sh].upcase
    else
      result_arr << e
    end
    counter += 1
    idx += 1 
    break if idx == a.size
  end
  result_arr.join
end

u = "I should have known that you would have a perfect answer for me!!!"
p movingShift(u, 1)

# struggling to understand directions on how to divide return array into 5 subarrays, come back to later...
