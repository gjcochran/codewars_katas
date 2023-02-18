def stat(str)
  a = str.split(',')
  times_secs = []
  ints = a.map do |el|
    s = el.split('|')
    hr, min, sec = s[0].to_i, s[1].to_i, s[2].to_i
    times_secs << ((hr * 3600) + (min * 60) + sec)
  end
  sor = times_secs.sort
  sz = times_secs.size
  ran = times_secs.max - times_secs.min
  ave = times_secs.sum / times_secs.size
  if sz.odd?
    med = sor[sz / 2]
  else
    med = sor.slice((sz/2 - 1), 2).sum / 2
  end
  range = [h = ran.divmod(3600).first, m = (ran - (h * 3600)).divmod(60).first, ran - (h * 3600) - (m * 60)]
  range = range.map { |el| "%02d" % el }.join('|')
  average = [h = ave.divmod(3600).first, m = (ave - (h * 3600)).divmod(60).first, ave - (h * 3600) - (m * 60)]
  average = average.map { |el| "%02d" % el }.join('|')
  median = [h = med.divmod(3600).first, m = (med - (h * 3600)).divmod(60).first, med - (h * 3600) - (m * 60)]
  median = median.map { |el| "%02d" % el }.join('|')
  "Range: #{range} Average: #{average} Median: #{median}"
end

p stat("01|15|59, 1|47|6, 01|17|20, 1|32|34, 2|3|17")
p stat("01|15|59, 1|47|16, 01|17|20, 1|32|34, 2|17|17")
