def simplify(poly)
  poly.gsub(/\b\w+/, '1\0') 
end

p simplify('dc+dcba') # cd+abcd
p simplify("2xy-yx") # xy
p simplify("-a+5ab+3a-c-2a") # -c+5ab
p simplify("xzy+zby") # byz+xyz
