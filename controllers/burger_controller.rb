require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/burger.rb')
require_relative( '../models/eatery.rb')

get '/burgers' do
  @all_burgers = []
  @all_prices = []
  
  @burgers = Burger.all()

  for burger in @burgers

    @all_burgers << burger.name
    price = burger.find_price(burger.price_id).first
    @all_prices << price

  end


  erb ( :"burgers/index" )
end