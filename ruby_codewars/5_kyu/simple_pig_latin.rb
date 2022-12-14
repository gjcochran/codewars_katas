# https://www.codewars.com/kata/520b9d2ad5c005041100000f

# Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.

# Examples
# pig_it('Pig latin is cool') # igPay atinlay siay oolcay
# pig_it('Hello world !')     # elloHay orldway !

def pig_it(str)
  str.split.map do |sub| 
    first = sub[0]
    sub.size > 1 ? nsub = sub.delete_prefix(first) : sub
    if sub.size > 1 && sub.match?(/[a-zA-z]/)
      nsub << first << 'ay'
    elsif sub.match?(/[a-zA-z]/) && sub.size == 1
      sub << 'ay' 
    else
      sub
    end
  end.join(' ')
end

p pig_it('Pig latin is cool') # 'igPay atinlay siay oolcay'
p pig_it('This is my string') # 'hisTay siay ymay tringsay'
p pig_it("Cucullus non facit monachum") 
p pig_it("Quis custodiet ipsos custodes ?") 
p pig_it("O tempora o mores !") 

# best practices answer pasted below
# def pig_it text
#   text.gsub(/(\w)(\w+)*/, '\2\1ay')
# end