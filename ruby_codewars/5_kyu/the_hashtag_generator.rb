# https://www.codewars.com/kata/52449b062fb80683ec000024

# The marketing team is spending way too much time typing in hashtags.

# Generator rules:
# It must start with a hashtag (#).
# All words must have their first letter capitalized.
# If the final result is longer than 140 chars it must return false.
# If the input or the result is an empty string it must return false.
# Examples
# " Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
# "    Hello     World   "                  =>  "#HelloWorld"
# ""                                        =>  false

# D/A
  # irb(main):006:0> arr = "Do We have A Hashtag".split
  # => ["Do", "We", "have", "A", "Hashtag"]

  # irb(main):007:0> arr.unshift('#')
  # => ["#", "Do", "We", "have", "A", "Hashtag"]

  # irb(main):009:0> arr.join
  # => "#DoWehaveAHashtag"

def generateHashtag(str)
  if str.split.join.empty?
    false
  else
    h = str.split.map(&:capitalize).unshift('#').join 
    h.size < 141 ? h : false
  end
end


# tests
p generateHashtag("") #=>, false, "Expected an empty string to return false")
p generateHashtag(" " * 200) #=>, false, "Still an empty string")
p generateHashtag("Do We have A Hashtag") #=>, "#DoWeHaveAHashtag", "Expected a Hashtag (#) at the beginning.")
p generateHashtag("Codewars") #=>, "#Codewars", "Should handle a single word.")
p generateHashtag("Codewars Is Nice") #=>, "#CodewarsIsNice", "Should remove spaces.")
p generateHashtag("Codewars is nice") #=>, "#CodewarsIsNice", "Should capitalize first letters of words.")
p generateHashtag("code" + " " * 140 + "wars") #=>, "#CodeWars")
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") #=>, false, "Should return false if the final word is longer than 140 chars.")
p generateHashtag("a" * 139) #=>, "#A" + "a" * 138, "Should work")
p generateHashtag("a" * 140) #=>, false, "Too long")

# my answer was relatively similar to optimal, some slight efficiencies which am pasting below for reference...
# def generateHashtag(str)
#   str = "#" << str.split.map(&:capitalize).join
#   str.size <= 140 && str.size > 1 ? str : false
# end