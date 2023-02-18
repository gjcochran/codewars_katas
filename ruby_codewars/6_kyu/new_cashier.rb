def get_order(order)
  menu_arr = %w(burger fries chicken pizza sandwich onionrings milkshake coke)
  clean_order = order.scan(/(burger|fries|chicken|pizza|sandwich|onionrings|milkshake|coke)/)
  clean_order = clean_order.flatten.sort_by { |el| menu_arr.index(el) }
  clean_order.flatten.map(&:capitalize).join(' ')
end

p get_order("milkshakepizzachickenfriescokeburgerpizzasandwichmilkshakepizza")
