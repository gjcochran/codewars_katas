def smallest(n)
  num = n.to_s.chars.map(&:to_i)
  result = []
  num.each_index do |i|
    num.size.times do |s|
      temp = num.clone.map(&:clone)
      rep = temp.delete_at(i)
      temp.insert(s, rep)
      result << [temp.join.to_i, i, s]
    end
  end
  result.sort.first
end

p smallest(261235)
p smallest(209917)
