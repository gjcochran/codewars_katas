def average_string(s)
  return "n/a" if s.empty? 
  nums = { "zero" => 0,
           "one" => 1, 
           "two" => 2,
           "three" => 3,
           "four" => 4,
           "five" => 5,
           "six" => 6,
           "seven" => 7,
           "eight" => 8,
           "nine" => 9
  }

  conv = s.split.map { |w| nums[w] }
  return "n/a" if conv.include?(nil)
  avg = conv.sum / conv.size
  nums.key(avg)
end

p average_string("zero nine ten five two")
