# https://www.codewars.com/kata/517abf86da9663f1d2000003/train/ruby

# Complete the method/function so that it converts dash/underscore delimited words into camel casing. The first word within the output should be capitalized only if the original word was capitalized (known as Upper Camel Case, also often referred to as Pascal case). The next words should be always capitalized.

#   Examples
#   "the-stealth-warrior" gets converted to "theStealthWarrior"
#   "The_Stealth_Warrior" gets converted to "TheStealthWarrior"

def to_camel_case(str)
  return '' if str.empty?
  arr = str.split(/[_-]/)
  arr.map.with_index { |el, idx| idx > 0 ? el.capitalize : el }.join
end

p to_camel_case('') # ''
p to_camel_case("the_stealth_warrior") # "theStealthWarrior"
p to_camel_case("The-Stealth-Warrior") # "TheStealthWarrior"
p to_camel_case("A-B-C") # "ABC"

# codewars answer
def to_camel_case_CW(str)
  str.gsub(/[_-](.)/) {"#{$1.upcase}"}
end
p to_camel_case_CW("the_stealth_warrior")