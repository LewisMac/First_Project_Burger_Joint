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

get '/eateries/new' do
  @eatery_names = Eatery.all_names()

  erb(:"eateries/new")
end

post '/eateries' do
  eatery = Eatery.new( params )
  eatery.save
  redirect to('/eateries')
end

post '/eateries/:id/delete' do
  Eatery.delete( params[:id] )
  redirect to('/eateries')
end

get '/eateries/:id' do
  @eatery = Eatery.find( params[:id] )
  erb(:'eateries/eatery_show')
end

