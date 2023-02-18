def diamond(n)
  return nil if n.even? || n < 0
  sp = ' '
  st = '*' 
  
  1.upto(n) do |i|
    if i.even?
      next
    else
      puts "#{sp * ((n-i)/2)}" + "#{st * i}" + "#{sp * ((n-i)/2)}" 
    end
  end

  (n-2).downto(1) do |i|
    if i.even?
      next
    else 
      puts "#{sp * ((n-i)/2)}" + "#{st * i}" + "#{sp * ((n-i)/2)}"
    end
  end
end

diamond(5)
diamond(9)
diamond(4)

# 1.upto(n) { |i| i.even? ? next : (puts "#{sp * ((n-i)/2)}" + "#{st * i}" + "#{sp * ((n-i)/2)}") }
# (n-2).downto(1) { |i| i.even? ? next : (puts "#{sp * ((n-i)/2)}" + "#{st * i}" + "#{sp * ((n-i)/2)}")
