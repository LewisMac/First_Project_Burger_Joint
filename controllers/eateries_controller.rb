require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/eatery.rb')

get '/eateries' do
  @eateries = Eatery.all()
  erb ( :"eateries/index" )
end