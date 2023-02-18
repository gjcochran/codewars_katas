def what_century(year)
  s = year.chars
  unless s[2..3].join == '00'
    c = s[0..1].join.to_i + 1
  else
    c = s[0..1].join.to_i
  end
  case c
  when (10..20) then "#{c}th"
  else
    case c.to_s.chars.last.to_i
    when 1 then "#{c}st"
    when 2 then "#{c}nd"
    when 3 then "#{c}rd"
    else
      "#{c}th"
    end
  end
end

p what_century('4201')
p what_century('1900')
p what_century('9290')
