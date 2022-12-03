# https://www.codewars.com/kata/55953e906851cf2441000032/train/ruby

# Background
# There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

# Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

# In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

# Requirement
# return a string where:

# the first and last characters remain in original place for each word
# characters between the first and last characters must be sorted alphabetically
# punctuation should remain at the same place as it started, for example: shan't -> sahn't
# Assumptions

# words are seperated by single spaces
# only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
# special characters do not take the position of the non special characters, for example: -dcba -> -dbca
# for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
# ignore capitalisation

# D/A
# str.split(' ') to turn into array split by spaces (to handle multiple words)
# iterate over array...
  # use str[0] and str[-1] to record first and last character and save the variables
  # then str.chop!.delete_prefix!(str[0]) to mutate and delete first and last characters
  # array.chars so that each subarray is split into various characters that can sort using each
  # add str[0] + sorted + str[1]

# C

def scramble_words(str)
  arr = str.split(' ')
  result = []
  arr.each do |word|
    punct = {}
    if word.match(/\W/)
      arr_punc = word.scan(/\W/)
      arr_punc.each do |punc|
        punct[word.index(punc)] = punc
      end
      word.gsub!(/\W/, '')
    end
    prefix = word[0]
    suffix = word[-1] 
    new_word = word.chop.delete_prefix(word[0]).chars.sort.join
    if word.size > 1
      scrambled_word = "#{prefix}#{new_word}#{suffix}"
    else
      scrambled_word = word
    end
    if punct.any?
      punct.each { |k, v| scrambled_word.insert(k, v) }
    end
    result << scrambled_word
  end
  result.join(' ')
end


# TESTCASES
p scramble_words("sbeelnqstuuy four, rbeiiorttun paacdiilnotun lcik-on. bilss aadeiilntuvn. no") 
p scramble_words('professionals') # 'paefilnoorsss', 'The first and last letters of a word should reamin in place with the inner letters sorted')
p scramble_words('i') # 'i', 'Must handle single charater words')
p scramble_words('') # '', 'Must handle empty strings')
p scramble_words('me') # 'me', 'Must handle 2 charater words')
p scramble_words('you') # 'you', 'Must handle 3 charater words')
p scramble_words('card-carrying') # 'caac-dinrrryg', 'Only spaces separate words and punctuation should remain at the same place as it started')
p scramble_words("shan't") # "sahn't", 'Punctuation should remain at the same place as it started')
p scramble_words('-dcba') # '-dbca', 'Must handle special character at the start')
p scramble_words('dcba.') # 'dbca.', 'Must handle special character at the end')
p scramble_words("must be")
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") # "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth.", 'Must handle a full sentence')
  