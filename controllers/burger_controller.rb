require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/burger.rb')
require_relative( '../models/eatery.rb')

get '/burgers' do
  
  @burgers = Burger.all()
  erb ( :"burgers/index" )
end