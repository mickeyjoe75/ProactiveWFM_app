require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/admin_controller.rb')


get '/' do
  erb( :index )
end
