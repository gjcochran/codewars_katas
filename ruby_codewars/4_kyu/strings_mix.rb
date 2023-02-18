# task: 
#   determine count of each lowercase letter for both strings
#   determine which string has max of each letter
#     if letter max is not > 1, ignore letter
#     if is from string1, output 1:... 
#       2:...
#       if both strings have same max, then write =:...
#       ... is the letter x max times ex.. '2:eeee' means string2 has 4 total lowercase e characters
#     return as contigous string separated by backslashes
#   sort by num and then letter (if num is same)
# examples

# s1 = "my&friend&Paul has heavy hats! &"
# s2 = "my friend John has many many friends &"
# mix(s1, s2) --> "2:nnnnn/1:aaaa/1:hhh/2:mmm/2:yyy/2:dd/2:ff/2:ii/2:rr/=:ee/=:ss"

# s1 = "mmmmm m nnnnn y&friend&Paul has heavy hats! &"
# s2 = "my frie n d Joh n has ma n y ma n y frie n ds n&"
# mix(s1, s2) --> "1:mmmmmm/=:nnnnnn/1:aaaa/1:hhh/2:yyy/2:dd/2:ff/2:ii/2:rr/=:ee/=:ss"

# s1="Are the kids at home? aaaaa fffff"
# s2="Yes they are here! aaaaa fffff"
# mix(s1, s2) --> "=:aaaaaa/2:eeeee/=:fffff/1:tt/2:rr/=:hh"

def mix(s1, s2)
  s1_hsh = Hash.new
  s2_hsh = Hash.new
  ('a'..'z').each { |l| s1_hsh[l] = l }
  ('a'..'z').each { |l| s2_hsh[l] = l }
  s2_arr = s2.chars
  s1_arr = s1.chars

  s1_arr.each_with_object ({}) { |el, _|
    if el.match?(/[a-z]/)
      s1_hsh[el] = el * s1.count(el) if s1_arr.count(el) > 1 
    end
  }
  s2_arr.each_with_object ({}) { |el, _|
    if el.match?(/[a-z]/)
      s2_hsh[el] = el * s2.count(el) if s2_arr.count(el) > 1 
    end
  }

  eqs = s1_hsh.select { |k, _| s1_hsh[k] == s2_hsh[k] && s1_hsh[k].size > 1 }
  ones = s1_hsh.select { |k, _| s1_hsh[k] > s2_hsh[k] }
  twos = s2_hsh.select { |k, _| s2_hsh[k] > s1_hsh[k] }
  eqs = eqs.to_a
  eqs.each { |sub| sub[0] = '=:' }
  ones = ones.to_a
  ones.each { |sub| sub[0] = '1:' }
  twos = twos.to_a
  twos.each { |sub| sub[0] = '2:' }

  result = (eqs + ones + twos).map(&:join)
  result.sort_by! { |s|
    [
    -s.size,
    s.codepoints
    ]
  }
  result.join('/')
end

s1 = "my&friend&Paul has heavy hats! &"
s2 = "my friend John has many many friends &"
p mix(s1, s2)

# review: solved! proud of this one. 
# codewars answer if much more streamlined, pasted below for ref:
# def mix(s1, s2)
#  selection = ('a'..'z').to_a.select { |letter| s1.count(letter) > 1 || s2.count(letter) > 1 }
#  selection.map! do |selection| 
#    if s1.count(selection) > s2.count(selection)
#      "1:#{selection * s1.count(selection)}"
#    elsif s1.count(selection) < s2.count(selection)
#      "2:#{selection * s2.count(selection)}"
#    else
#      "=:#{selection * s1.count(selection)}"
#    end
#  end
#  selection.sort_by { |x| [-x.size, x[0], x[-1]] }.join("/")
#end

