require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/burger.rb')
require_relative( '../models/eatery.rb')

get '/burgers' do
  @all_burgers = []
  @all_prices = []
  @all_ids = []
  
  @burgers = Burger.all()

  for burger in @burgers

    @all_burgers << burger.name
    price = burger.find_price(burger.price_id).first
    @all_prices << price
    
    @all_ids << burger.id

  end

  erb ( :"burgers/index" )
end

get '/burgers/new' do
  @eatery_names = Eatery.all_names()

  erb(:new)
end

post '/burgers' do
  
  eatery_id = Eatery.find_by_name(params['eatery'])[0]['id']

  price = Price.new({ 'price_value' => params['cost'] })
  price.save
  price_id = price.id
  
  
  
  burger_name = params['name']

  options = {
    'name' => burger_name,
    'eatery_id' => eatery_id,
    'price_id' => price_id
  }

  burger = Burger.new( options )
  burger.save
  redirect to('/burgers')
end


