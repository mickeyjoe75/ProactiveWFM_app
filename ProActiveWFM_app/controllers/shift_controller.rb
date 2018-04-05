require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/employee.rb' )
require_relative( '../models/shift.rb' )
require('pry')

# Add new shifts

get '/shifts/new' do
  @shifts = Shift.all()
  erb ( :"shifts/new" )
end


post '/shifts' do
  shift = Shift.new(params)
  shift.save
    redirect to("/shifts/new")
end
