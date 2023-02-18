# distance (d) = speed (s) * time (t)
# runner can sprint at 2x speed for 1 unit of time...
#   but then speed permantently reduced by 1 unit
#   plus need 1 additional unit of time of recovery where cannot sprint
# input: given s and t
# output: find maximum possible
# algo: determined rule... always end on a sprint
# therefore... options are, for example
# t = 5
#   SRSRS, RRSRS, RRRRS
# t = 6
#   RSRSRS, RRRSRS, RRRRRS
# t = 7
#   SRSRSRS, RRSRSRS, RRRRSRS, RRRRRRS
# etc....

def max_distance(s, t)
  max_options = (t/2.0).round
  potential_distances = []
  1.upto(max_options) do |i|
    if i == 1 
      sub = 0
    elsif i == 2
      sub = 3
    else 
      sub = 9 * (i-2)
    end
    potential_distances << ((i * (s * 2)) + ((t-i) * s) - sub)
  end
  potential_distances.max
end

p max_distance(9, 7)
p max_distance(6, 7)
p max_distance(9, 3)
p max_distance(4, 5)

# all basic tests work, but fail many of the larger number tests, so logic must be off
# perhaps am over-simplifying options, although tbh seems straightforward
# marking as UNFINISHED to come back to at a later date
