# https://www.codewars.com/kata/57f8ff867a28db569e000c4a/train/ruby

# Modify the kebabize function so that it converts a camel case string into a kebab case.

#   kebabize('camelsHaveThreeHumps') // camels-have-three-humps
#   kebabize('camelsHave3Humps') // camels-have-humps

# D/A
# remove numbers
# split string by capital letters... # use a positive lookahead regular expression (i.e. ?=)
# join(-)

  # irb(main):027:0> str
  # => "myCamelHas3Humps"
  # irb(main):028:0> str2 = str.chars.select { |el| el.match?(/[a-zA-Z]/) }.join
  # => "myCamelHasHumps"

#   irb(main):038:0> str2
# => "myCamelHasHumps"
# irb(main):039:0> str2.split(/(?=[A-Z])/)
# => ["my", "Camel", "Has", "Humps"]

def kebabize(str)
  letters = str.chars.select { |el| el.match?(/[a-zA-Z]/) }.join
  letters.split(/(?=[A-Z])/).join('-').downcase
end

p kebabize('camelsHaveThreeHumps')
p kebabize('camelsHave3Humps')

# codewars solution was similar to mine, although cleverly used gsub method to remove the numbers on the same line as the rest of the kebabize method

def kebabize_BP(str)
  str.gsub(/([0-9])/, '').split(/(?=[A-Z])/).join('-').downcase
end

p kebabize_BP('camelsHaveThreeHumps')
p kebabize_BP('camelsHave3Humps')