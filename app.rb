require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('controllers/burger_controller')
require_relative('controllers/deal_controller')
require_relative('controllers/eateries_controller')
require_relative('models/days.rb')
require_relative('models/deal.rb')
require_relative('models/price.rb')

get '/' do
  @days = Day.all
  erb( :index )
end

get "/:day" do
  @deal_info = []
  @all_deals = []
  @day_deals = []

  day_deals = Deal.find_by_day(params[:day])

  for deal in day_deals
    @deal_info = deal.information
    @all_deals << Price.find(@deal_info[0]['price_id'])
    @all_deals << @deal_info[0]
    @all_deals << @deal_info[1]
    @all_deals << @deal_info[2]
    @day_deals << @all_deals
  end

  @day = params[:day]

  erb( :"days/day" )
end





