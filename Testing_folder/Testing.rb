require('pry-byebug')

def percentage_off(price, percent)

  percent_off = percent/100.0
  deal_price = percent_off * price
  return deal_price

end

puts percentage_off(100, 75)