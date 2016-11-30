require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/deal.rb')
require_relative( '../models/eatery.rb')
require_relative( '../models/joining.rb')
require_relative( '../models/burger.rb')
require_relative( '../models/joining_set_price.rb')
require_relative( '../models/x_for_y_deals.rb')
require_relative( '../models/deals/percentage_off.rb')

get '/deals' do

  @all_deals = []
  @xydeals = []
  @deal_ids = []
  @deal_prices = []
  @new_price = []

  @deals = Deal.all()
  @set_price = JoiningSetPrice.all
  @xyall_deals = XForYDeals.all

  for deal in @deals
    @deal_info = deal.information
    @day = deal.find_day(deal.id).first
    @all_deals << @deal_info
    
  end
  @joindeals = Joining.all
  @xy_deal_info = []
  @other_deals = []
  @day_deals = []
  @xydeal_info = []
  all_keys = []

  @other_deals << @joindeals.group_by{ |x| x.deal_id }

  for deal in @other_deals
    for key, value in deal
      all_keys << key.to_i
    end
  end
  all_keys.sort!


  counter = all_keys.min
  other_counter = 0

  for deal in @other_deals[0]
    @burger_names = []
    
    @xy_deal_info << deal[1][other_counter].x_y_information(deal[1][other_counter].deal_id)
    
    for id in deal[1]

      burger_id = id.burger_id

      @burger_names << Burger.find(burger_id)
    end
    
    @xy_deal_info << @burger_names
    @xydeal_info << @xy_deal_info

    counter += 1
  end

  @set_price_array = []
  info = []

  for deal in @set_price
    
    info << Price.find(deal.price_id.to_i)
    info << Burger.find(deal.burger_id.to_i)
    @set_price_array << info
  end

  erb ( :"deals/index" )
end

get '/deals/:id' do

  @deal_burgers = []
  @x_y = []
  
  all_deals = XForYDeals.all


  @all_deals = all_deals[0].find_burgers_in_deal(params[:id])
  burger_id_array = @all_deals.burger_id.split(',')
  for id in burger_id_array
    @deal_burgers << Burger.find(id)
  end

  @x_y << @all_deals.x_value
  @x_y << @all_deals.y_value

  erb( :"x_for_y/index" )
end

get '/deals/:id/info' do
  deal_no = Deal.find(params[:id])
  @deals = deal_no.information

  erb( :"deals/information" )
end


get '/testing' do

  @burgers = []
  @deals = Joining.all
  counter = 0

  for deal in @deals
    @burgers << deal.burger
    counter += 1
  end



  erb( :testing )

end











