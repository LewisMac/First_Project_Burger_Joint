require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/burger.rb')
require_relative( '../models/eatery.rb')

get '/burgers' do
  @all_burgers = []
  
  @burgers = Burger.all()

  for burger in @burgers

    @all_burgers << burger.name
    
  end

  erb ( :"burgers/index" )
end