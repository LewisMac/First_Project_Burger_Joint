require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('controllers/burger_controller')
require_relative('controllers/deal_controller')
require_relative('controllers/eateries_controller')
require_relative('controllers/create_new')
require_relative('models/days.rb')
require_relative('models/deal.rb')
require_relative('models/x_for_y_deals.rb')
require_relative('models/joining_set_price.rb')
require_relative('models/price.rb')

get '/' do
  @days = Day.all
  erb( :index )
end

get "/:day" do
  @deal_info = []
  @all_deals = []
  @day_deals = []
  @xy_day_deals = []
  @set_price_deals = []

  @day_deals << Deal.find_by_day(params[:day])
  @xy_day_deals << XForYDeals.find_by_day(params[:day])
  @set_price_deals << JoiningSetPrice.find_by_day(params[:day])

  
  for deal in @day_deals
    if deal != []
      @all_deals << {:percent => deal[0].percentage_off}
    end
  end

  for deal in @xy_day_deals
    if deal != []
      @all_deals << {:x => deal[0].x_value, :y => deal[0].y_value}
    end
  end

  for deal in @set_price_deals
    if deal != []
      @all_deals << {:price => Price.find(deal[0].price_id)}
    end
  end

  @day = params[:day]

  erb( :"days/day" )
end





