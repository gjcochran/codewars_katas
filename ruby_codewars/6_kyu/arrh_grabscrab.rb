def grabscrab(anagram, dictionary)
  dictionary.select { |w| w.chars.sort == anagram.chars.sort }
end

p grabscrab("ortsp", ["sport", "parrot", "ports", "matey"])
