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
  deals = Deal.all

  for deal in deals  
    deals = deal.find_by_day("#{params[:day]}")
    @deal_info << Hash['name', deals.deal_type]
    @deal_info << deals.information[0]
    @deal_info << deals.information[1]
    @all_deals << @deal_info
  end

  @day = params[:day]

  erb( :day)
end





