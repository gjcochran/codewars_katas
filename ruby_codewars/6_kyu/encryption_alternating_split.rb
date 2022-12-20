# https://www.codewars.com/kata/57814d79a56c88e3e0000786/train/ruby

# Implement a pseudo-encryption algorithm which given a string S and an integer N concatenates all the odd-indexed characters of S with all the even-indexed characters of S, this process should be repeated N times.

# Examples:

# encrypt("012345", 1)  =>  "135024"
# encrypt("012345", 2)  =>  "135024"  ->  "304152"
# encrypt("012345", 3)  =>  "135024"  ->  "304152"  ->  "012345"

# encrypt("01234", 1)  =>  "13024"
# encrypt("01234", 2)  =>  "13024"  ->  "32104"
# encrypt("01234", 3)  =>  "13024"  ->  "32104"  ->  "20314"
# Together with the encryption function, you should also implement a decryption function which reverses the process.

# If the string S is an empty value or the integer N is not positive, return the first argument without changes.

def encrypt(text, n)
  str = text
  n.times do
    odds = str.chars.select.with_index { |el, idx| idx.odd? }
    evens = str.chars.select.with_index { |el, idx| idx.even? }
    str = odds.concat(evens).join
  end
  str
end

def decrypt(encrypted_text, n)
  str = encrypted_text
  n.times do
    first = str[0..((str.size/2)-1)].chars
    second = str[(str.size/2)..-1].chars
    arr = second.zip(first).flatten.reject(&:nil?)
    str = arr.join
  end
  str
end

# p encrypt("This is a test!", 0) # "This is a test!")
# p encrypt("This is a test!", 1) # "hsi  etTi sats!")
# p encrypt("This is a test!", 2) # "s eT ashi tist!")
# p encrypt("This is a test!", 3) # " Tah itse sits!")
# p encrypt("This is a test!", 4) # "This is a test!")
# p encrypt("This is a test!", -1) # "This is a test!")
# p encrypt("This kata is very interesting!", 1) # "hskt svr neetn!Ti aai eyitrsig")
p decrypt("This is a test!", 0) # "This is a test!")
p decrypt("hsi  etTi sats!", 1) # "This is a test!")
p decrypt("s eT ashi tist!", 2) # "This is a test!")
p decrypt(" Tah itse sits!", 3) # "This is a test!")
p decrypt("This is a test!", 4) # "This is a test!")
p decrypt("This is a test!", -1) # "This is a test!")
p decrypt("hskt svr neetn!Ti aai eyitrsig", 1) # "This kata is very interesting!")
p encrypt("", 0) # "")
p decrypt("", 0) # "")