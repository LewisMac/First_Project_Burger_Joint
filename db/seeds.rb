require_relative( '../models/burger.rb' )
require_relative( '../models/days.rb' )
require_relative( '../models/deal.rb' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/price.rb' )

require('pry-byebug')

Burger.delete_all
Price.delete_all
Eatery.delete_all

eatery1 = Eatery.new({
  'name' => 'Place name here'
  })

eatery1.save

price1 = Price.new({
  'price_value' => 20
  })

price1.save

burger1 = Burger.new({
  'name' => 'burgerburger',
  'price_id' => price1.id,
  'eatery_id' => eatery1.id
  })

burger1.save

binding.pry
nil









