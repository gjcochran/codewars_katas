def rot(strng)
  a = strng.split("\n") 
  a = a.reverse.map(&:reverse)
  a.join("\n")
end

def selfie_and_rot(string)
  rev = rot(string).split("\n")
  slf = string.split("\n")
  rev = rev.map { |e| "#{e}\n" }
  slf = slf.map { |e| "\n#{e}" }
  result = slf + ["\n"] + rev
  dots = '.' * rev.size 
  final_str = result.join("#{dots}")
  final_str.chomp!
  final_str[1..-1]
end

def oper(f, s)
  f.call(s)
end

str = "abcd\nefgh\nijkl\nmnop"
p selfie_and_rot(str)
p oper(method(:selfie_and_rot), str)
