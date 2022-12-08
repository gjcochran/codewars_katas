# https://www.codewars.com/kata/56b861671d36bb0aa8000819/train/ruby

# Your task is to Reverse and Combine Words. It's not too difficult, but there are some things you have to consider...

# So what to do?
# Input: String containing different "words" separated by spaces

# 1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
#    (odd number of words => last one stays alone, but has to be reversed too)
# 2. Start it again until there's only one word without spaces
# 3. Return your result...
# Some easy examples:
# Input:  "abc def"
          # 1  2 
# Output: "cbafed"
          # 1.r 2.r

# Input:  "abc def ghi 123"
          # 1  2   3   4
# Output: "defabc123ghi"
            # 2 1   4  3

# Input:  "abc def gh34 434ff 55_eri 123 343"
          # 1   2   3     4     5     6   7
# Output: "43hgff434cbafed343ire_55321"
          # 3.r 4.r  1.r 2.r 7r 5.r 6.r 


# Input: "234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44"
          # 1       2       3       4       5     6       7
# Output: "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
          # 3.r    4.r      1.r    2.r  7r  5.r  6.r 

# Input: "sdfsdf wee sdffg 342234 ftt"
          # 1     2   3     4      5
# Output: "gffds432243fdsfdseewttf"     
          # 3.r  4.r   1.r  2.r  5.r      

# 7 test
# ab cd ef gh ij kl mn
# badc fehg jilk nm
# cdabghef klijmn
# fehgbadcnmjilk
# 3r4r1r2r7r5r6r 


def reverse_and_combine_text(str)
  arr = str.split

  if arr.size > 1
    loop do
      if arr.size.odd?
        result = []
        last = arr.last
        arr.pop
        (arr.size).times do |i|
          result << (arr[i].reverse).concat((arr[i+1].reverse)) if i.even?
        end
        result.push(last.reverse)
      else
        result = []
        (arr.size).times do |i|
          result << (arr[i].reverse).concat((arr[i+1].reverse)) if i.even?
        end
      end
      arr = result
      result = []
      break if arr.size == 1
    end
    arr.join
  else
    arr.join
  end
end

# p reverse_and_combine_text("abc def") #=> "cbafed")
# p reverse_and_combine_text("abc def ghi jkl") #=> "defabcjklghi")
# p reverse_and_combine_text("dfghrtcbafed") #=> "dfghrtcbafed")
# p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") #=> "trzwqfdstrteettr45hh4325543544hjhjh21lllll")
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") #=> "gffds432243fdsfdseewttf")

# codewars answer below, shorter than mine but a bit trickier to parse through due to recusion!

# def reverse_and_combine_text(s)
#   return s if s.split(' ').size == 1
#   words = s.split(' ')
#   words = words.map { |word| word.reverse }
#   words = words.each_slice(2).to_a.map { |slice| slice.join}.join(' ')
#   reverse_and_combine_text(words)
# end
