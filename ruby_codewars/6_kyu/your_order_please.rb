# https://www.codewars.com/kata/55c45be3b2079eccff00010f/train/ruby

# Your task is to sort a given string. Each word in the string will contain a single number. This number is the position the word should have in the result.

# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

# If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.

# Examples
# "is2 Thi1s T4est 3a"  -->  "Thi1s is2 3a T4est"
# "4of Fo1r pe6ople g3ood th5e the2"  -->  "Fo1r the2 g3ood 4of th5e pe6ople"
# ""  -->  ""

def order(words)
  return '' if words == ''
  result = []
  arr = words.split
  counter = 1
  loop do
    result << arr.select { |el| el.include?(counter.to_s) }
    counter += 1
    break if counter > arr.size
  end
  result.join(' ')
end

p order("is2 Thi1s T4est 3a") # "Thi1s is2 3a T4est")
p order("4of Fo1r pe6ople g3ood th5e the2") # "Fo1r the2 g3ood 4of th5e pe6ople")
p order("") # "", "Empty input should return empty string")

# codewars answer used sort_by method and regex [/\d/]

# def order(words)
#   words.split.sort_by{ |w| w[/\d/] }.join(' ')
# end

# irb(main):009:0> "4of"[/\d/]
# => "4"