require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )


get '/pointless' do

erb( :pointless )

end



