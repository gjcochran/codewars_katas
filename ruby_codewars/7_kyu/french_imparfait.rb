# https://www.codewars.com/kata/6394c1995e54bd00307cf768/train/ruby

# When speaking/writing French, you use L’imparfait (the imperfect tense) to describe continuous or habitual actions in the past.

# For example, you would use l'imparfait to translate "I was thinking", because thinking is an action that happens over a length of time. You wouldn't use l'imparfait to translate "I won the boss battle", as it's an action that happens once.

# Think of it as the French equivalent of our Past Progressive.

# Task
# Given a simple French phrase, consisting of a subject and a verb in its infinitive form, you need to turn it into L'imparfait, using the table below. To conjugate a sentence in l'imparfait, drop the last two letters of the verb and replace it with the correct ending based on the subject.

# Here are the endings to replace the verb with:

# Subject	Verb Ending
# Je (I)	-ais
# Tu (You)	-ais
# Il/Elle/On (He/She/It or We)	-ait
# Nous (We)	-ions
# Vous (You or Y'all)	-iez
# Ils/Elles (They)	-aient
# Let's say you want to translate I was walking to French:

# Take the subject + infinitive: Je marcher
# Remove the last two letters: Je march
# Apply the correct ending: Je marchais
# You get Je marchais, which can be checked with our handy dandy google translate.

# Examples
# Je manger     -->  Je mangais   
# Tu dormir     -->  Tu dormais
# Elle coder    -->  Elle codait
# Il livrer     -->  Il livrait
# On parler     -->  On parlait
# Nous aller    -->  Nous allions
# Vous partir   -->  Vous partiez
# Ils jouer     -->  Ils jouaient
# Elles gagner  -->  Elles gagnaient

def to_imparfait(str)
  hsh = {
    'Je' => 'ais',
    'Tu' => 'ais',
    'Il' => 'ait',
    'Elle' => 'ait',
    'On' => 'ait',
    'Nous' => 'ions',
    'Vous' => 'iez',
    'Ils' => 'aient',
    'Elles' => 'aient'
  }
  arr1 = str.split
  con = hsh[arr1[0]]
  arr2 = str.chars
  arr2.pop
  arr2.pop
  arr2.join + con
end


 # "Should take a short sentence and convert it to L'Imparfait
p to_imparfait("Je aller") # eq("Je allais")
    
#  # Should be able to handle all of the subjects
p to_imparfait("Je manger") #   eq("Je mangais")
p to_imparfait("Tu dormir") #    eq("Tu dormais")
p to_imparfait("Elle coder") #   eq("Elle codait")
p to_imparfait("Il parler") #    eq("Il parlait")
p to_imparfait("On rentre") #   eq("On rentait")
p to_imparfait("Nous aller") #  eq("Nous allions")
p to_imparfait("Vous partir") #  eq("Vous partiez")
p to_imparfait("Ils jouer") #    eq("Ils jouaient")
p to_imparfait("Elles gagner") # eq("Elles gagnaient")
 
 # Should work even if the verb isn't a real word
p to_imparfait("Je jwijefwijer") # eq("Je jwijefwijais")
p to_imparfait("On irre") #        eq("On irait")


# codewars answer below
# def to_imparfait(phrase)
#   dd = {'Je'=>'ais', 'Tu'=>'ais', 'Il'=>'ait', 'Elle'=>'ait', 'On'=>'ait',
#         'Nous'=>'ions', 'Vous'=>'iez', 'Ils'=>'aient', 'Elles'=>'aient'}
#   return phrase[0...-2] + dd[phrase.split.first]
# end