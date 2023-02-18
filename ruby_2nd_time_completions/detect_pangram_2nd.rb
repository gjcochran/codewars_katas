# input: string
# ouptut: boolean
# rules: true if contains every letter of alphabet at least once 
#   case not relevent

def pangram?(string)
  string.downcase.scan(/[a-z]/).uniq.size == 26
end

p pangram?("The quick brown fox jumps over the lazy dog")
