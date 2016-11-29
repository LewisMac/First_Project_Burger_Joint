require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/deal.rb')
require_relative( '../models/eatery.rb')
require_relative( '../models/burger.rb')
require_relative( '../models/x_for_y_deals.rb')

get '/deals' do

  @all_deals = []
  @xydeals = []
  @deal_ids = []

  @deals = Deal.all()

  @xyall_deals = XForYDeals.all

  for deal in @deals
    @deal_info = deal.information
    @day = deal.find_day(deal.id).first
    @all_deals << @deal_info
  end

  for deal in @xyall_deals
    @xydeals << deal.x_y_information
    
  end

  for deal in @xydeals
    @deal_ids << deal[0]['burger_id']
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
 deals = []
 deal_ids = []
 burgers = []
  all_deals = XForYDeals.all
  
  for deal in all_deals
    deals << deal.x_y_information
  end
  
  for deal in deals
    @deal_ids << deal[0]['burger_id']
  end

  for deal in @deal_ids
    deal_array = deal.split(',')
    for burger_id in deal_array
      burgers << Burger.find(burger_id)
    end
  end
  
  erb( :testing )

end











