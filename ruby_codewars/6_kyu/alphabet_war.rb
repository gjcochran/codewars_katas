def alphabet_war(fight_info)
  left = { 'w' => 4, 'p' => 3, 'b' => 2, 's' => 1 }
  right = { 'm' => 4, 'q' => 3, 'd' => 2, 'z' => 1 }

  arr = fight_info.chars
  arr[1..-2].each_with_index do |e, i|
    if e == '*'
      arr[i], arr[i+1], arr[i+2] = nil 
    end
  end
  arr.compact!

  left_score = 0
  right_score = 0

  arr.each do |e|
    left_score += left[e] if left[e] != nil
    right_score += right[e] if right[e] != nil
  end
  
  return "Let's fight again!" if left_score == right_score
  left_score > right_score ? "Left side wins!" : "Right side wins!" 
end

p alphabet_war("z*dq*mw*pb*s")
p alphabet_war("sz**z**zs")
