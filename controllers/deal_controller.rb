require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/deal.rb')
require_relative( '../models/eatery.rb')
require_relative( '../models/burger.rb')

get '/deals' do
  @deals = Deal.all()
  erb ( :"deals/index" )
end

get '/deals/:id/info' do

  deal_no = Deal.find(params[:id])

  @deals = deal_no.information
  # binding.pry
  erb( :"deals/index" )
end