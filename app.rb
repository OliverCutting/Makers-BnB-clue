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
    @user = User.find(session[:user_id])
    erb(:index)
  end

  get '/newlisting' do
    erb(:newlisting)
  end

  post '/' do
    Room.create(params[:address])
    redirect('/')
  end

  post '/bookingcompleted' do
    'Thank you for booking!'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
