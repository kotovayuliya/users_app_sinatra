require 'rubygems'
require 'active_record'
require 'sqlite3'

require_relative 'yuliya.rb'
require_relative 'models/user.rb'
require_relative 'establish_connection.rb'

def render_users
  @users = User.all
  erb 'users/index', binding
end

['/',  'users/new'].each do |path|
  get path do
    erb 'users/new', binding
  end
end

post '/' do
  User.create(params['user'])
  render_users
end

get '/users' do
  render_users
end

get '/find_user' do
  @user = User.find(params['id'])
  erb 'users/show', binding
end

get '/edit' do
  @user = User.find(params['id'])
  erb 'users/edit', binding
end

post '/users/update' do
  @user = User.find(params['id'])
  @user.update(params['user'])
  erb 'users/show', binding
end

post '/users/delete' do
  @user = User.delete(params['id'])
  render_users
end

Rack::Handler::WEBrick.run Yuliya::Application, Port: 9292
