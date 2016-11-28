require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/eatery.rb')
require_relative( '../models/burger.rb')

get '/eateries' do
  @all_eateries = []
  
  @eateries = Eatery.all()

  for eatery in @eateries

    @all_eateries << eatery.name
    
  end

  erb ( :"eateries/index" )

end