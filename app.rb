require 'sinatra/base'
require 'sinatra/reloader'
require './lib/room'

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

  get '/newlisting' do
    erb(:newlisting)
  end

  post '/' do
    Room.create(address = params[:address])
    redirect('/')
  end

  post '/bookingcompleted' do
    'Thank you for booking!'
  end

  run! if app_file == $0
end
