require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'pony'
require './lib/room'
require './lib/user'
require './lib/mailer'
require './database_connection_setup'


class MakersBnB < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
  register Sinatra::Flash

  get '/test_page' do
    'Test page'
  end

  get '/' do
    @rooms = Room.list
    @user = User.find(id: session[:user_id])
    erb(:index)
  end

  get '/newlisting' do
    erb(:newlisting)
  end

  post '/' do
    Room.create(params[:address], params[:description], params[:price_per_night], params[:start_date], params[:end_date])
    redirect('/')
  end

  post '/bookingcompleted' do
    Room.book(params[:room_id], params[:date], session[:user_id])
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users/new' do
    flash[:notice] = 'You must be signed in to do that.'
    redirect('/users/new')
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    Mailer.registrationconfirmation(params[:email])
    redirect '/'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $0
end
