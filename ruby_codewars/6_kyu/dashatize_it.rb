def dashatize(num)
  return 'nil' unless num.is_a?(Integer)
  num.abs.to_s.gsub(/([13579])/, "-\\&-").gsub('--', '-').gsub(/^-(.+)$/, '\\1').gsub(/^(.+)-$/, '\\1')
end

p dashatize(1234)
p dashatize(9302)
p dashatize(5311)
