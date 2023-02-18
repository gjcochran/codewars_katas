def deep_count(a)
  counter = 0
  f = a
  loop do
    counter += f.size
    f = f.select { |e| e.is_a? Array }
    break if f.empty?
    f.flatten!(1) 
  end
  counter
end

p deep_count([1, 2, [3, 4, [5]]])
