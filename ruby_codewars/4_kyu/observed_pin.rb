

def get_pins(observed)
  options = {
    1 => [1, 2, 4],
    2 => [1, 2, 3, 5],
    3 => [2, 3, 6],
    4 => [1, 4, 5, 7],
    5 => [2, 4, 5, 6, 8],
    6 => [3, 5, 6, 9],
    7 => [4, 7, 8],
    8 => [5, 7, 8, 9, 0],
    9 => [6, 8, 9],
    0 => [8, 0]
  }
  all_options = []
  observed.each_char do |i|
    all_options << options[i.to_i]
  end
  results = all_options.first.product(*all_options.drop(1))
  results.uniq.map { |sub| sub.map(&:to_s) }.map(&:join)
end

p get_pins('8')
p get_pins('11')
p get_pins('369')

# review: works but is a bit complex. using * and drop to find product with a variable number
# of subarrays was good learning experience (substack)
# codewars best answer is significantly more simple, though in essence is similar,
# the greatest difference is a clever use of Enumerable#reduce
# def get_pins(observed)
 # mapping = {
  #  "1" => %w(1 2 4), 
   # "2" => %w(1 2 3 5),
  #  "3" => %w(2 3 6), 
 #   "4" => %w(1 4 5 7), 
   # "5" => %w(2 4 5 6 8), 
  #  "6" => %w(3 5 6 9), 
 #   "7" => %w(4 7 8), 
    #"8" => %w(5 7 8 9 0), 
    #"9" => %w(6 8 9), 
   # "0" => %w(8 0)
  #}
 # observed.split(//).map {|key| mapping[key] }.reduce {|m, x| m.product(x).map(&:join) }
#end
