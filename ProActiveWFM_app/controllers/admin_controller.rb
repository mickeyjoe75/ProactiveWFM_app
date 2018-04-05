require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/location.rb' )
require_relative( '../models/campaign.rb' )
require_relative( '../models/department.rb' )
require_relative( '../models/team.rb' )
require_relative( '../models/jobtitle.rb' )




get '/admin' do
    @team = Team.all
  # @location = Location.all
  # @campaign = Campaign.all

  erb ( :"admin/new" )
end


post '/admin' do
  team = Team.new(params)
  team.save
  redirect to("/admin")
end


# post '/admin' do
#   location = Location.new(params)
#   location.save
#   redirect to("/admin")
# end

# post '/admin' do
#   campaign = Campaign.new(params)
#   campaign.save
#   redirect to("/admin")
# end
