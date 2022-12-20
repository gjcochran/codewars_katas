# https://www.codewars.com/kata/57b06f90e298a7b53d000a86/train/ruby

# There is a queue for the self-checkout tills at the supermarket. Your task is write a function to calculate the total time required for all the customers to check out!

# input
# customers: an array of positive integers representing the queue. Each integer represents a customer, and its value is the amount of time they require to check out.
# n: a positive integer, the number of checkout tills.
# output
# The function should return an integer, the total time required.

# Important
# Please look at the examples and clarifications below, to ensure you understand the task correctly :)

# Examples
# queue_time([5,3,4], 1)
# # should return 12
# # because when n=1, the total time is just the sum of the times

# queue_time([10,2,3,3], 2)
# # should return 10
# # because here n=2 and the 2nd, 3rd, and 4th people in the 
# # queue finish before the 1st person has finished.

# queue_time([2,3,10], 2)
# # should return 12
# Clarifications
# There is only ONE queue serving many tills, and
# The order of the queue NEVER changes, and
# The front person in the queue (i.e. the first element in the array/list) proceeds to a till as soon as it becomes free.

def queue_time(customers, n)
  if customers.empty?
    0
  elsif customers.size <= n
    customers.max 
  else
    tills = (1..n).to_a
    hsh = tills.each_with_object({}).with_index { |(el, h), idx| h[el] = customers[idx] }
    counter = hsh.size
    time = 0
    # p hsh
    # p customers.size
    # p hsh.size
    loop do
      # p hsh.select { |_,v| v != 0 }
      
      time += 1
      # p "time is #{time}"
      # p counter
      hsh.each { |k,_| hsh[k] -= 1 }
      # p hsh
      if hsh.select { |_,v| v == 0 }.any? && counter < customers.size
        empties = hsh.select { |_,v| v == 0 }
        # p empties
        if customers.size > n
          empties.each do |k, v| 
            hsh[k] = customers[counter] unless counter > customers.size - 1
            counter += 1 
          # p counter
          # p hsh
          end
        end
      end
      # p hsh
      break if hsh.select { |k, v| v <= 0 }.size == tills.size
    end
    time
  end
end

# p queue_time([], 1) # 0,
# p queue_time([5], 1) # 5, 
# p queue_time([2], 5) # 2, 
p queue_time([1,2,3,4,5], 1) # 15, "
# p queue_time([1,2,3,4,5], 100) # 5, 
# p queue_time([2,2,3,3,4,4], 2) # 9, 
# p queue_time([935, 9, 820, 7, 8, 9, 19, 1, 2, 35, 94, 2, 173, 10, 2, 6, 23, 222, 55, 791, 432, 7, 879, 60, 888, 324, 85, 26, 656, 471, 139, 46, 910, 6, 8, 667, 262, 30, 21, 336, 7, 9, 27, 40, 73, 7, 1, 93, 1, 248, 479, 270, 33, 531, 1, 9, 2, 27, 740, 912, 180, 451, 17, 34, 2], 53)

p queue_time([10, 7, 775, 392, 134, 5, 10, 956, 384, 605, 397, 8, 821, 5, 45, 337, 312, 9, 7, 386, 53, 7, 313, 628, 56, 99, 87, 49, 72, 369, 2, 55, 346, 29, 1, 3, 855, 60, 572, 3, 805, 45, 47, 8, 8, 83, 73, 25, 10, 1, 872, 1, 1, 30, 469, 9, 7, 430, 458, 7, 5, 88, 8, 9, 38, 8, 458, 872, 86, 7, 90, 2, 99, 32, 387, 501], 75)

# made this way too complicated, solution above works but is not at all efficient or simple to follow

# codewars solution below # super clever... builds an array of n size with each value starting at 0 to represent the tills. then iterates thru customers array and adds the customer integer to the current minimum till array element. therefore the max till element will be the total time to completion...

def queue_time_CW(customers, n)
  arr = Array.new(n, 0)
  customers.each { |customer| arr[arr.index(arr.min)] += customer }
  arr.max
end