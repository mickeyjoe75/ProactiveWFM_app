require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/employee.rb' )
require_relative( '../models/shift.rb' )

# view showing emplyee Schedules

get '/employees' do
  @employees = Employee.all()
  erb ( :"employees/index" )
end

get '/employees/:id' do
  @employee = Employee.find(params['id'].to_i)
  erb(:"employees/show")
end
