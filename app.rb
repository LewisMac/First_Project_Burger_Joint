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

get "/Monday" do
  deals = Deal.all
  for deal in deals  
    @deals = deal.find_by_day('Monday')
  end
  erb( :"days/day1")
end

get "/Tuesday" do
  deals = Deal.all
  for deal in deals  
    @deals = deal.find_by_day('Tuesday')
  end
  erb( :"days/day2")
end

get "/Wednesday" do
  deals = Deal.all
  for deal in deals  
    @deals = deal.find_by_day('Wednesday')
  end
  erb( :"days/day3")
end

get "/Thursday" do
  deals = Deal.all
  for deal in deals  
    @deals = deal.find_by_day('Thursday')
  end
  erb( :"days/day4" )
end

get "/Friday" do
  deals = Deal.all
  for deal in deals  
    @deals = deal.find_by_day('Friday')
  end
  erb( :"days/day5")
end

get "/Saturday" do
  deals = Deal.all
  for deal in deals  
    @deals = deal.find_by_day('Saturday')
  end
  erb( :"days/day6")
end

get "/Sunday" do
  deals = Deal.all
  for deal in deals  
    @deals = deal.find_by_day('Sunday')
  end
  erb( :"days/day7")
end





