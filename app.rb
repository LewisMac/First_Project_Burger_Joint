require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('controllers/burger_controller')
require_relative('controllers/deal_controller')
require_relative('controllers/eateries_controller')
require_relative('models/days.rb')
require_relative('models/deal.rb')

get '/' do
  @days = Day.all
  erb( :index )
end

get "/:day" do
  @deal_info = []
  @all_deals = []

  day_deals = Deal.find_by_day(params[:day])

  for deal in day_deals
    @deal_info = deal.information
    @all_deals << @deal_info
  end

  @day = params[:day]

  erb( :"days/day" )
end





