def doors(n)
  door_status = {}
  (1..n).each { |i| door_status[i] = 0 }
  1.upto(n) do |i|
    (1..n).each do |num|
      if num % i == 0 && door_status[num] == 0
        door_status[num] = 1
      elsif num % i == 0 && door_status[num] == 1
        door_status[num] = 0
      else
        next
      end
    end
  end
  door_status.select { |_, v| v == 1 }.size
end

p doors(5)

# works, but times out on cwars tests so need to refactor and simplify
# guessing theres an algo so that dont have to go one by one...
