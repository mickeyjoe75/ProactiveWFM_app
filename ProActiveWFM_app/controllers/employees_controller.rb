require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/employee.rb' )
require_relative( '../models/shift.rb' )
require('pry')

# add new employees

get '/employees/new' do
  @employees = Employee.all()
  erb ( :"employees/new" )
end


post '/employees' do
  employee = Employee.new(params)
  employee.save
    redirect to("/employees/new")
end



# get '/employees/:id' do
#   @employees = Employee.find(params['id'].to_i)
#   erb(:"employees/show")
# end
