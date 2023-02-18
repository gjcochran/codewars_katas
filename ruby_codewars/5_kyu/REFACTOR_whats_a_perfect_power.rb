def isPP(n)
  counter = 2
  loop do
    temp = Math.log(n, counter)
    break if temp <= 2.0
    counter += 1
  end

  2.upto(counter) do |i|
    2.upto(counter) do |e|
      if i ** e == n
        return [i, e]
      end
    end
  end
  nil
end

p isPP(4)
p isPP(36)
p isPP(5)

# works but times out so need to refactor.
