def parse(data)
  commands = data.split(//)
  result = []
  value = 0 
  
  commands.each do |com|
    case com
    when 'i' then value += 1
    when 'd' then value -= 1
    when 's' then value *= value
    when 'o' then result.push(value)
    else 
      next
    end
  end 
  result
end

p parse('iiisdoso')

# review: works. could have used `each_char` method
