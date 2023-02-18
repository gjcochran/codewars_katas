# input: 2 strings
#   full string, string ending
# output: boolean
# ... return true if str ends in str_end

def solution(str, ending)
  return true if ending == ''
  chars = ending.size
  str[-chars..-1] == ending
end

# review: works
# could have used the `end_with?` method...
# ie.
# `str.end_with?(ending)`
