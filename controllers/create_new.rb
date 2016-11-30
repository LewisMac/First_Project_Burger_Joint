require_relative( '../db/sql_runner' )


get '/' do
  return 'yeay'
end

get '/newburgers' do
  @burgers = Burger.all()
  erb(:adding_things)
end

get '/students/new' do
  @house_names = House.all_names()
  erb(:new)
end

post '/students' do
  wizard = Wizard.new( params )
  wizard.save
  redirect to('/students')
end

post '/students/:id/delete' do
  Wizard.delete( params[:id] )
  redirect to('/students')
end

get '/students/:id' do
  @student = Wizard.find( params[:id] )
  erb(:show)
end

get '/house/new' do
  erb(:new_house)
end

post '/house' do
  house = House.new( params )
  house.save
  redirect to('/students')
end

