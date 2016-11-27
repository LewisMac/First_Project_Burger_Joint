require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/deal.rb')
require_relative( '../models/eatery.rb')
require_relative( '../models/burger.rb')

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

get '/deals/:id/info' do

  deal_no = Deal.find(params[:id])

  @deals = deal_no.information
  
  erb( :"deals/index" )
end