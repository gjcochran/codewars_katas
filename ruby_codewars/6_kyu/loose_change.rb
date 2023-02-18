def loose_change(cents)
  coins = {
    'Pennies' => 0,
    'Nickels' => 0,
    'Dimes' => 0,
    'Quarters' => 0
  }

  return coins if cents <= 0
  num = cents.to_i

  t = num.divmod(25)
  coins['Quarters'] = t[0]
  num = t[1]
  
  t = num.divmod(10)
  coins['Dimes'] = t[0]
  num = t[1]

  t = num.divmod(5)
  coins['Nickels'] = t[0]
  coins['Pennies'] = t[1]

  coins
end

p loose_change(91)

