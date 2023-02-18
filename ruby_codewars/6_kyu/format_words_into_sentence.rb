def format_words(words)
  return '' if words.nil? || words.empty?

  arr = words.reject { |e| e == '' }

  result = arr.map.with_index do |e, i|
    if i == arr.size - 1
      " and #{e}"
    elsif i == 0
      e 
    else
      ", #{e}"
    end
  end
  result.join
end

p format_words(['ninja', '', 'ronin'])
