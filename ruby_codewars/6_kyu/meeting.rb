def meeting(s)
  a = s.upcase.split(';')
  a = a.map { |sub| sub.scan(/\w+/).reverse }.sort.map { |sub| sub.join(', ') }
  a.map do |sub| 
    sub.insert(0, '(')
    sub.insert(-1, ')')
  end
  a.join("")
end

p meeting("Fred:Corwill;Wilfred:Corwill;Barney:Tornbull;Betty:Tornbull;Bjon:Tornbull;Raphael:Corwill;Alfred:Corwill")

# good. could have done with gsub...written out below:
# `s.upcase.gsub(/(\w+):(\w+)/) {"(#{$2}, #{$1})"}.split(';').sort.join`
