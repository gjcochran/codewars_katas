# https://www.codewars.com/kata/57873ab5e55533a2890000c7/train/ruby

# You have to create a method, that corrects a given time string.
# There was a problem in addition, so many of the time strings are broken.
# Time is formatted using the 24-hour clock, so from 00:00:00 to 23:59:59.
# Examples
# "09:10:01" -> "09:10:01"  
# "11:70:10" -> "12:10:10"  
# "19:99:99" -> "20:40:39"  
# "24:01:01" -> "00:01:01"  
# If the input-string is null or empty return exactly this value!

# D/A
# i suspect there was a way to use the format method with Time class to solve this... going to do a more brute force approach

def time_correct(t)
  if t.nil?
    nil
  elsif t.empty?
    t
  elsif t.match?(/\d\d:\d\d:\d\d/)
    arr = t.split(':').map(&:to_i)
    secs = arr[2]
    mins = arr[1]
    hrs = arr[0]
    if secs > 59
      mins += (secs.divmod(60)[0])
      secs -= 60
    end
    if mins > 59
      hrs += (mins.divmod(60)[0])
      mins -= 60
    end
    if hrs > 23
      hrs = (hrs.divmod(24)[1])
    end
    arr = [hrs, mins, secs].map(&:to_s)
    arr = arr.map { |el| el.size == 2 ? el : "0#{el}" }
    arr.join(':')
  else
    nil
  end
end

p time_correct("09:10:01")
p time_correct("11:70:10")
p time_correct("19:99:99")
p time_correct("24:01:01")

# codwars answer
# def time_correct(t)  
#   return t if t.nil? || t.empty?
#   return unless t =~ /^\d{2}(:\d{2}){2}$/
#   t = t.split(":").map(&:to_i)
#   Time.at(t[0] * 3600 + t[1] * 60 + t[2]).strftime "%H:%M:%S"
# end