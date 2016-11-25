require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

get '/burgers' do
  # @burgers = Burger.all()
  erb ( :"burgers/index" )
end