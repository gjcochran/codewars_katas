# https://www.codewars.com/kata/52742f58faf5485cae000b9a/train/ruby

# Your task in order to complete this Kata is to write a function which formats a duration, given as a number of seconds, in a human-friendly way.

# The function must accept a non-negative integer. If it is zero, it just returns "now". Otherwise, the duration is expressed as a combination of years, days, hours, minutes and seconds.

# It is much easier to understand with an example:

# * For seconds = 62, your function should return 
#     "1 minute and 2 seconds"
# * For seconds = 3662, your function should return
#     "1 hour, 1 minute and 2 seconds"
# For the purpose of this Kata, a year is 365 days and a day is 24 hours.

# Note that spaces are important.

# Detailed rules
# The resulting expression is made of components like 4 seconds, 1 year, etc. In general, a positive integer and one of the valid units of time, separated by a space. The unit of time is used in plural if the integer is greater than 1.

# The components are separated by a comma and a space (", "). Except the last component, which is separated by " and ", just like it would be written in English.

# A more significant units of time will occur before than a least significant one. Therefore, 1 second and 1 year is not correct, but 1 year and 1 second is.

# Different components have different unit of times. So there is not repeated units like in 5 seconds and 1 second.

# A component will not appear at all if its value happens to be zero. Hence, 1 minute and 0 seconds is not valid, but it should be just 1 minute.

# A unit of time must be used "as much as possible". It means that the function should not return 61 seconds, but 1 minute and 1 second instead. Formally, the duration specified by of a component must not be greater than any valid more significant unit of time.

def format_duration(input)
  return 'now' if input == 0
  one = input.divmod(60)
  seconds = one[1]
  if one[0] > 59
    two = one[0].divmod(60)
    minutes = two[1]
    if two[0] > 23
      three = two[0].divmod(24)
      hours = three[1]
      if three[0] > 364
        four = three[0].divmod(365)
        days = four[1]
        years = four[0]
      else
        days = three[0]
        # return "#{days} days, #{hours} hours, #{minutes} minutes and #{seconds} seconds"
      end
    else
      hours = two[0]
      # return "#{hours} hours, #{minutes} minutes and #{seconds} seconds"
    end
  else
    minutes = one[0]
    # return "#{minutes} minutes and #{seconds} seconds"
  end

  result = ''
  case
  when years.nil? || years.zero?
    result << ''
  when years > 1
    result << "#{years} years, "
  when years == 1
    result << "#{years} year, "
  end
  case
  when days.nil? || days.zero?
    result << ''
  when days > 1
    result << "#{days} days, "
  when days == 1
    result << "#{days} day, "
  end
  case
  when hours.nil? || hours.zero?
    result << ''
  when hours > 1
    result << "#{hours} hours, "
  when hours == 1
    result << "#{hours} hour, "
  end
  case
  when minutes.nil? || minutes.zero?
    result << ''
  when minutes > 1
    result << "#{minutes} minutes and "
  when minutes == 1
    result << "#{minutes} minute and "
  end
  case
  when seconds.nil? || seconds.zero?
    result << ''
  when seconds > 1
    result << "#{seconds} seconds"
  when seconds == 1
    result << "#{seconds} second"
  end
 
  result.end_with?(', ') ? result.delete_suffix!(', ') : result
  result.end_with?('and ') ? result.delete_suffix!(' and ') : result
 
end

p format_duration(1) #=> "1 second")
p format_duration(62) #=> "1 minute and 2 seconds")
p format_duration(120) #=> "2 minutes")
p format_duration(3600) #=> "1 hour")
p format_duration(3662) #=> "1 hour, 1 minute and 2 seconds")
p format_duration(50000)
p format_duration(500000)
p format_duration(5000000)
p format_duration(5000000000)

# COME BACK TO THIS LATER 
# IM SURE CAN REFACTOR... WORKS BUT IS WAY TOO LONG + STILL HAVE ISSUE WHERE NEED LAST SUBSTRING TO READ AND 4 MINUTES || AND 7 HOURS ETC RATHER THAN , 4 MINUTES (CURRENTLY ONLY HAVE AND INPUTTED FOR SECONDS AS THE LAST SUBSTRING)