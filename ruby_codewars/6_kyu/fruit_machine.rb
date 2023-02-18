def fruit(reels, spins)
  items = %w(Jack Queen King Bar Cherry Seven Shell Bell Star Wild)
  scores = (1..10).each_with_object({}) { |el, h| h[items[el-1]] = el }

  spun = spins.map.with_index { |n, i| reels[i][n] }
  return 100 if spun.uniq == ['Wild']

  spun.include?('Wild') ? (mult = 2) : (mult = 1)
  grouped = spun.sort.chunk_while { |a, b| a == b }.to_a
  item = grouped.reject { |sub| sub.size == 1 }.flatten
  item.size == 3 ? (thr = 10) : (thr = 1)
  return 0 if item.empty?
  return 10 if item.first == 'Wild'

  scores[item.first] * mult * thr
end

reel1 = ["Wild","Star","Bell","Shell","Seven","Cherry","Bar","King","Queen","Jack"]
reel2 = ["Wild","Star","Bell","Shell","Seven","Cherry","Bar","King","Queen","Jack"]
reel3 = ["Wild","Star","Bell","Shell","Seven","Cherry","Bar","King","Queen","Jack"]
spin = [0,5,5]
p fruit([reel1,reel2,reel3],spin)

# cwars cleverness below for ref...
SCORES = %w[Jack Queen King Bar Cherry Seven Shell Bell Star Wild].map.with_index(1).to_h

def fruit_cw(reels, spins)
  items = reels.zip(spins).map { |reel, spin| reel[spin] }
  unique = items.sort_by { |item| -items.count(item) }.uniq
  multiplier = case unique.count
    when 2 then unique.last == "Wild" ? 2 : 1
    when 1 then 10
    else 0
  end

  SCORES[unique.first] * multiplier
end
