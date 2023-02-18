# inputs: text string, width(chars)
# output: string -- as few lines as possible
#           where: 
#             first and last char of line is not a width
#             words must be completed by end of line
#             must be at least 1 space between each word
#             therefore... goal is to add variable number
#               of spaces between each word such that can
#               fill the width line w max number of consecutive
#               words for each line until text is complete
#             final line does not need to be complete ie can end in spaces

# String class has ljust and rjust methods, but not sure how these would help
# String class length method tells number of chars
# want to use sprintf but not sure how to use with a variable number of words
