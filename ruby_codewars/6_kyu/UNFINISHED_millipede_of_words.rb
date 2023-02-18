def solution_rd1(arr)
  firsts = arr.map { |el| el[0] }
  lasts = arr.map { |el| el[-1] }

  comb = firsts.concat(lasts)
  comb.select { |letter| comb.count(letter) == 1 }.size == 2
end

def solution(arr)
  firsts = arr.map { |el| el[0] }
  lasts = arr.map { |el| el[-1] }
  arr.each do |word|
    unless firsts.include?(word[-1])
      next  
    else 

    end
  end
end

p solution(["excavate", "endure", "desire", "screen", "theater", "excess", "night"])
