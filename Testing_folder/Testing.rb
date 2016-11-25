require('pry-byebug')
require_relative( '../models/days.rb' )

# def percentage_off(price, percent)

#   percent_off = percent/100.0
#   deal_price = percent_off * price
#   return deal_price

# end

# puts percentage_off(100, 75)

# def two_for_one(price1, price2)

#   prices = []
#   prices << price1
#   prices << price2
#   deal_price = prices.max
#   return deal_price
# end

# puts two_for_one(20, 26)

# def set_price(price)
#   return price
# end

puts Day.all[1]
