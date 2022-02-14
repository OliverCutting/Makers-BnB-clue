require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader 
  end

  get '/test_page' do
    'Test page'
  end

  get '/' do
    @rooms = Room.list
    erb(:index)
  end

  run! if app_file == $0
end
