require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/deal.rb')
require_relative( '../models/eatery.rb')
require_relative( '../models/burger.rb')
require_relative( '../models/x_for_y_deals.rb')

get '/deals' do

  @all_deals = []

  @deals = Deal.all()

  for deal in @deals
    @deal_info = deal.information
    @day = deal.find_day(deal.id).first
    @all_deals << @deal_info
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

  erb( :"deals/index" )
end











