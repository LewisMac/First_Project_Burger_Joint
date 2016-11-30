require_relative( '../models/burger.rb' )
require_relative( '../models/days.rb' )
require_relative( '../models/joining.rb' )
require_relative( '../models/deal.rb' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/price.rb' )
require_relative( '../models/x_for_y_deals.rb' )

require('pry-byebug')

Burger.delete_all
Price.delete_all
Eatery.delete_all

eatery1 = Eatery.new({
  'name' => 'Eatery no 1'
  })
eatery1.save

eatery2 = Eatery.new({
  'name' => 'Eatery no 2'
  })
eatery2.save

price4 = Price.new({
  'price_value' => 10
  })
price4.save

price1 = Price.new({
  'price_value' => 20
  })
price1.save

price2 = Price.new({
  'price_value' => 15
  })
price2.save

price3 = Price.new({
  'price_value' => 16
  })
price3.save

burger1 = Burger.new({
  'name' => 'burgerburger',
  'price_id' => price3.id,
  'eatery_id' => eatery1.id
  })
burger1.save

burger2 = Burger.new({
  'name' => 'Hamburger',
  'price_id' => price1.id,
  'eatery_id' => eatery2.id
  })
burger2.save

burger3 = Burger.new({
  'name' => 'Cheeseburger',
  'price_id' => price2.id,
  'eatery_id' => eatery1.id
  })
burger3.save

burger4 = Burger.new({
  'name' => 'Chilli Burger',
  'price_id' => price1.id,
  'eatery_id' => eatery2.id
  })
burger4.save

burger5 = Burger.new({
  'name' => 'Veggie Burger',
  'price_id' => price3.id,
  'eatery_id' => eatery2.id
  })
burger5.save

multiple_vals1 = XForYDeals.new({
  'x_value' => 2,
  'y_value' => 1,
  'burger_id' => [burger1.id, burger3.id],
  'eatery_id' => eatery2.id
  })
multiple_vals1.save(0)

multiple_vals2 = XForYDeals.new({
  'x_value' => 5,
  'y_value' => 3,
  'burger_id' => [burger1.id, burger2.id, burger3.id, burger4.id, burger5.id],
  'eatery_id' => eatery1.id
  })
multiple_vals2.save(1)

joining_table1 = Joining.new({
  'deal_id' => multiple_vals2.id,
  'burger_id' => burger1.id
  })
joining_table1.save
joining_table2 = Joining.new({
  'deal_id' => multiple_vals2.id,
  'burger_id' => burger2.id
  })
joining_table2.save
joining_table3 = Joining.new({
  'deal_id' => multiple_vals2.id,
  'burger_id' => burger3.id
  })
joining_table3.save
joining_table4 = Joining.new({
  'deal_id' => multiple_vals2.id,
  'burger_id' => burger4.id
  })
joining_table4.save
joining_table5 = Joining.new({
  'deal_id' => multiple_vals2.id,
  'burger_id' => burger5.id
  })
joining_table5.save

joining_table6 = Joining.new({
  'deal_id' => multiple_vals1.id,
  'burger_id' => burger4.id
  })
joining_table6.save
joining_table7 = Joining.new({
  'deal_id' => multiple_vals1.id,
  'burger_id' => burger5.id
  })
joining_table7.save

deal1 = Deal.new({
  'deal_type' => 'Everything for £10',
  'eatery_id' => eatery1.id,
  'burger_id' => burger3.id
  })
deal1.save(3)

binding.pry
nil









