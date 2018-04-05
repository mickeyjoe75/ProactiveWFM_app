require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/location.rb' )
require_relative( '../models/campaign.rb' )
require_relative( '../models/department.rb' )
require_relative( '../models/team.rb' )
require_relative( '../models/jobtitle.rb' )




get '/admin' do
  @location = Location.all
  # @campaign = Campaign.all
  erb ( :"admin/index" )
end

post '/admin' do
  location = Location.new(params)
  loacaion.save
  redirect to("/employees")
end



#
# get '/bitings/new' do
#   @victims = Victim.all
#   @zombies = Zombie.all
#   erb(:"bitings/new")
# end
#
# post '/bitings' do
#   biting = Biting.new(params)
#   biting.save
#   redirect to("/bitings")
# end
#
# post '/bitings/:id/delete' do
#   Biting.destroy(params[:id])
#   redirect to("/bitings")
# end
