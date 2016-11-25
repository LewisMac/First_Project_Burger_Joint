require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/burger_controller')
require_relative('controllers/deal_controller')
require_relative('controllers/eateries_controller')

get '/' do
  erb( :index )
end