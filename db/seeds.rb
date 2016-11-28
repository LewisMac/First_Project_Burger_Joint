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

eatery2 = Eatery.new({
  'name' => 'Other Name Here'
  })
eatery2.save

price1 = Price.new({
  'price_value' => 20
  })
price1.save

price2 = Price.new({
  'price_value' => 30
  })
price2.save

price3 = Price.new({
  'price_value' => 100
  })
price3.save

burger1 = Burger.new({
  'name' => 'burgerburger',
  'price_id' => price3.id,
  'eatery_id' => eatery1.id
  })
burger1.save

burger2 = Burger.new({
  'name' => 'Rawr',
  'price_id' => price1.id,
  'eatery_id' => eatery2.id
  })
burger2.save

deal1 = Deal.new({
  'deal_type' => 'Two for One',
  'burger_id' => burger1.id,
  'eatery_id' => eatery1.id,
  'deal_price1' => price1.id,
  'deal_price2' => price2.id
  } )
deal1.save(2)

deal2 = Deal.new({
  'deal_type' => 'Other thing',
  'burger_id' => burger2.id,
  'eatery_id' => eatery2.id,
  'deal_price1' => price1.id,
  'deal_price2' => price2.id
  } )
deal2.save(2)



binding.pry
nil









