
def solution(input, markers)
  str = input
  markers.each do |m|
    str.gsub!(/[[:blank:]]*#{Regexp.quote(m)}.*[[:blank:]]*/, '')
  end
end
